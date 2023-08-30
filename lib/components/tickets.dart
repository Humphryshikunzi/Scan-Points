import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/pages/mobile/ride_details.dart';
import 'package:pamride/pages/mobile/search_result_load_more.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/ticketCard.dart';
import '../helpers/ColorsRes.dart';

class Tickets extends StatefulWidget {
  String originToCompare;
  String destinationToCompare;
  bool? sortByPrice = false;
  Tickets(
      {this.originToCompare = '',
      this.destinationToCompare = '',
      this.sortByPrice,
      Key? key})
      : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  ClientController _clientController = Get.find<ClientController>();

  @override
  void initState() {
    super.initState();
    validateSearchParams();
  }

  void validateSearchParams() {
    if (widget.originToCompare == '' && widget.destinationToCompare != '')
      setState(() {
        widget.originToCompare = widget.destinationToCompare;
      });
    else if (widget.originToCompare != '' && widget.destinationToCompare == '')
      setState(() {
        widget.destinationToCompare = widget.originToCompare;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Operation(
        operationRequest: GGetRidesReq((b) => b.vars
          ..from = 0
          ..to = 10000
          ..destinationFilter = widget.destinationToCompare.toLowerCase().trim()
          ..placeOfStartFilter = widget.originToCompare.toLowerCase().trim()),
        client: _clientController.client,
        builder: (BuildContext context,
            OperationResponse<GGetRidesData, GGetRidesVars>? response,
            Object? error) {
          // execute this if response from the query is null
          if (response!.data == null) {
            return Center(
                child: LinearProgressIndicator(color: ColorsRes.orangeColor));
          }

          // execute this if the query returns values
          else {
            final ridesList = response.data!.rides;
            List<GGetRidesData_rides> rides = [];
            ridesList.forEach((p0) {
              DateTime? departureDate =
                  convertGDateTimeToDateTime(p0.departureDate.toString()).toLocal();
              if (departureDate.isAfter(DateTime.now())) {
                rides.add(p0);
              }
            });
            // sort the rides by price
            if (widget.sortByPrice == true) {
              rides.sort((a, b) => a.estimatePrice
                  .toString()
                  .compareTo(b.estimatePrice.toString()));
            }

            // list view builder is used to display the rides as per specified origin
            return ListView.builder(
              itemCount: rides.length + 1,
              itemBuilder: (context, index) {
                /// we have added an extra index to the listview builder to accomodate the LOAD MORE BUTTON
                /// when the index is less than the size of the rides load the rides only
                /// however when the index is equal to the size of the rides load the button
                /// this is an if else statement to accomplish the task
                /// get the day,month,year,hour and minute from the two parameters (departureDate,departureTime)

                if (index < rides.length) {
                  var ride = rides[index];
                  var departurDate =
                      DateTime.parse(ride.departureDate.value.toString()).toLocal();

                  return InkWell(
                    onTap: () {
                      Get.to(() => RideDetail(
                            ride: rides[index],
                            departureDate: DateTime.parse(
                                ride.departureDate.value.toString()).toLocal(),
                          ));
                    },
                    child: TicketCard(
                        price: rides[index].estimatePrice.toString(),
                        name: rides[index].name.toString(),
                        id: rides[index].id.toString(),
                        destination: rides[index].destination.toString(),
                        placeOfStart: rides[index].placeofStart.toString(),
                        totalTime: 0,
                        status: rides[index].status!,
                        estimatedDistance:
                            rides[index].estimatedDistance.toString(),
                        estimatedTime: rides[index].duration.toString(),
                        departureDate: getFormatedDateTime(departurDate),
                        departureTime: getFormatedDateTime(departurDate),
                        profilePictureDataUrl: getCarImageUrl(
                            rides[index].car!.imageUrl.toString())),
                  );
                }

                /// if the index is equal to the rides length then load this button
                /// the button directs you to another page that has all the rides
                /// two extra pages for Tickets and Search result have been added to cater for this functionality
                else {
                  /// if there is no rides in this location show the alert for no rides plus the LOAD MORE RIDES button
                  if (rides.length == 0) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 1,
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          decoration:
                              BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "No rides on this location",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 17),
                              ),
                              Text(
                                "Try another location or load latest available rides to other locations",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultPageLoadMore()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsRes.orangeColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                child: Text(
                                  "LOAD MORE RIDES",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900),
                                )),
                          ),
                        ),
                      ],
                    );
                  }

                  /// if there are rides in this location do not show the alert for no rides
                  /// show only the button for load more rides
                  else {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultPageLoadMore()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsRes.orangeColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            child: Text(
                              "LOAD MORE RIDES",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w900),
                            )),
                      ),
                    );
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
}
