import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/models/schemas.dart';
import 'package:pamride/pages/mobile/ride_details.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:pamride/widgets/ticketCard.dart';

class RidesSearchResult extends StatefulWidget {
  String pickUpLocation = "";
  String destination = "";

  RidesSearchResult(this.pickUpLocation, this.destination, {Key? key})
      : super(key: key);

  @override
  State<RidesSearchResult> createState() => _RidesSearchResultState();
}

class _RidesSearchResultState extends State<RidesSearchResult> {
  /// Define the GraphQL query for fetching the paid trips trips

  /// string variables to store the origin and destination of the searched ride
  String placeOfStart = "";
  String destination = "";

  /// variable to store the number of rides matching the the selected origin and destination
  int numberOfRides = 0;

  /// initial function of the screen
  @override
  void initState() {
    super.initState();
    placeOfStart = widget.pickUpLocation;
    destination = widget.destination;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsRes.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Search results',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(color: ColorsRes.backgroundColor),
                child: Query(
                  options:
                      QueryOptions(document: getRidesToFroQuery, variables: {
                    "placeOfStartFilter": widget.pickUpLocation,
                    "destinationFilter": widget.destination,
                  }),
                  builder: (QueryResult result,
                      {VoidCallback? refetch, FetchMore? fetchMore}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }

                    if (result.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final ridesList = result.data?['rides'] as List<dynamic>;
                    final rides = [];
                    ridesList.forEach((p0) {
                      DateTime? departureDate = convertGDateTimeToDateTime(
                          p0["departureDate"].toString()).toLocal();
                      if (departureDate.isAfter(DateTime.now())) {
                        rides.add(p0);
                      }
                    });

                    if (rides.length > 0) {
                      return ListView.builder(
                        itemCount: (rides.length + 1),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index < rides.length) {
                            final ride = rides[index];
                            if (ride["destination"]
                                    .toString()
                                    .contains(destination) &&
                                ride["placeofStart"]
                                    .toString()
                                    .contains(placeOfStart)) {
                              numberOfRides = numberOfRides + 1;
                              return GestureDetector(
                                onTap: () {
                                  if (rides[index]['car']['imageUrl'] == null) {
                                    rides[index]['car']['imageUrl'] = '';
                                    Get.to(
                                      () => RideDetail(
                                        ride: GGetRidesData_rides.fromJson(
                                            rides[index]),
                                        departureDate: DateTime.parse(ride
                                            .departureDate.value
                                            .toString()).toLocal(),
                                      ),
                                    );
                                  } else {
                                    Get.to(
                                      () => RideDetail(
                                        ride: GGetRidesData_rides.fromJson(
                                            rides[index]),
                                        departureDate: (DateTime.parse(ride
                                            .departureDate.value
                                            .toString())).toLocal(),
                                      ),
                                    );
                                  }
                                },
                                child: TicketCard(
                                  price: ride["estimatePrice"].toString(),
                                  name: ride["name"],
                                  id: ride['id'].toString(),
                                  destination: ride["destination"],
                                  placeOfStart: ride["placeofStart"],
                                  totalTime: 0,
                                  status: RideStatus.Active,
                                  estimatedDistance: ride["estimatedDistance"],
                                  estimatedTime: ride["duration"],
                                  departureTime:
                                      getFormatedDateTime(ride["departureDate"]),
                                  departureDate:
                                      getFormatedDateTime(ride["departureDate"]),
                                  profilePictureDataUrl:
                                      getCarImageUrl(ride["car"]["imageUrl"]),
                                ),
                              );
                            } else {
                              SizedBox.shrink();
                            }
                          }

                          /// this container is executed based on conditions
                          /// the statement is executed last after the above statement has been executed
                          else {
                            /// return this container if there are no matching rides
                            if (numberOfRides == 0) {
                              return Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: Text(
                                          "No more rides for specified origin and destination",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey.shade400),
                                        ),
                                      ),
                                      Icon(
                                        Icons.directions_car_filled,
                                        color: Colors.grey.shade400,
                                        size: 70,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }

                            /// return this container if there are matching rides
                            else {
                              return SizedBox.shrink();
                            }
                          }
                          return SizedBox.shrink();
                        },
                      );
                    }

                    /// if there are no rides then return this notification
                    else {
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "No rides",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey.shade400),
                              ),
                              Icon(
                                Icons.directions_car_filled,
                                color: Colors.grey.shade400,
                                size: 70,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
