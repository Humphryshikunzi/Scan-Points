import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/pages/mobile/login_page.dart';
import 'package:pamride/pages/mobile/ride_details_profile.dart';
import 'package:pamride/pages/mobile/taps/profile_tap.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../controllers/client_controller.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gfl;

class BookingsPage extends StatefulWidget {
  final Ride? ride;
  final String? rideId;
  final bool? isDriver;
  final bool? isPast;
  final int? draftRides;
  BookingsPage(
      {this.ride,
      this.isDriver,
      this.isPast,
      this.draftRides,
      this.rideId,
      Key? key})
      : super(key: key);
  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Ride? loadedRide;
  late Future<Ride?> rideInfo;

  @override
  void initState() {
    _clientController.clearCache();
    if (widget.ride == null) {
      rideInfo = fetchRideData();
    } else {
      loadedRide = widget.ride;
    }
    super.initState();
    analytics.setCurrentScreen(screenName: "Bookings");
  }

  @override
  Widget build(BuildContext context) {
    if (loadedRide == null) {
      return Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
            ),
          ),
        ),
      );
    }

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          extendBody: true,
          backgroundColor: ColorsRes.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorsRes.backgroundColor,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ride Bookings',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Obx(() {
            return _accountController.isLoggedIn.value
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: lightBack,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TabBar(
                          tabs: <Widget>[
                            Tab(
                              child: Container(
                                child: Text(
                                  "Approve Bookings (${widget.draftRides})",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primary.withOpacity(0.1)),
                          unselectedLabelColor: lightBack,
                          labelColor: primary,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Bookings(
                            ride: loadedRide,
                            isDriver: widget.isDriver,
                            isPast: widget.isPast,
                          ),
                        ]),
                      ),
                    ],
                  )
                : LoginActivity(
                    backButtonEnabled: false,
                  );
          }),
        ));
  }

  Future<Ride?> fetchRideData() async {
    final gfl.GraphQLClient client = gfl.GraphQLClient(
      link: await await getLinkAndToken(),
      cache: gfl.GraphQLCache(),
    );
    int rideId = int.parse(widget.rideId!);
    final gfl.QueryOptions options = gfl.QueryOptions(
      document: gfl.gql('''
      query {
        rides(where: { id: { eq: $rideId } }) {
          allowedBehDesc
          id
          name
          departureDate
          departureTime
          placeofStart
          destination
          estimatedDistance
          numberOfPeople
          maximumCarryWeight 
          status
          arrivalTime
          departureTime
          duration
          routeIndex
          exactPickupLocation
          routeIndex
          seat {
            id
            backLeft
            frontLeft
            backCentre
            backRight
            middleLeft
            middleRight
            middleCentre
          }
          totalPay
          maxTotalPay
          seatCount
          seatCapacity
          estimatePrice
          users {
            userId
            user {
              id
              userName
              profilePictureDataUrl
            }
          }
          car {
            licensePlate
            imageUrl
            color
            model
            ownerId
            id
            owner {
              id
              firstName
              lastName
              userName
            }
          }
          transactions{ 
              status
              driverId
              passengerId
              phoneNumber
              amount
              seatsStr
              id
          }
        }
      }
    '''),
    );

    final gfl.QueryResult result = await client.query(options);
    if (result.hasException) {
      return null;
    }

    final dynamic rideObj = result.data!['rides'][0];
    if (rideObj.isEmpty) {
      return null;
    }

    Ride rideData = Ride(
      allowedBehDesc: rideObj["allowedBehDesc"],
      id: rideObj["id"],
      name: rideObj["name"],
      departureDate: rideObj["departureDate"],
      departureTime: rideObj["departureTime"],
      placeofStart: rideObj["placeofStart"],
      destination: rideObj["destination"],
      estimatedDistance: rideObj["estimatedDistance"],
      numberOfPeople: rideObj["numberOfPeople"],
      maximumCarryWeight: rideObj["maximumCarryWeight"],
      status: rideObj["status"],
      arrivalTime: rideObj["arrivalTime"],
      duration: rideObj["duration"],
      routeIndex: rideObj["routeIndex"],
      exactPickupLocation: rideObj["exactPickupLocation"],
      exactDropOffLocation: rideObj["exactDropOffLocation"] ?? "",
      seat: Seat(
        id: rideObj["seat"]["id"],
        backLeft: rideObj["seat"]["backLeft"],
        frontLeft: rideObj["seat"]["frontLeft"],
        backCentre: rideObj["seat"]["backCentre"],
        backRight: rideObj["seat"]["backRight"],
        middleLeft: rideObj["seat"]["middleLeft"],
        middleRight: rideObj["seat"]["middleRight"],
        middleCentre: rideObj["seat"]["middleCentre"],
      ),
      totalPay: double.parse(rideObj["totalPay"].toString()),
      maxTotalPay: double.parse(rideObj["maxTotalPay"].toString()),
      seatCount: rideObj["seatCount"],
      seatCapacity: rideObj["seatCapacity"],
      estimatePrice: double.parse(rideObj["estimatePrice"].toString()),
      users: (rideObj["users"] as List<dynamic>)
          .map((user) => User(
                userId: user["userId"],
                user: UserDetail(
                  id: user["user"]["id"],
                  userName: user["user"]["userName"],
                  profilePictureDataUrl: user["user"]["profilePictureDataUrl"],
                ),
              ))
          .toList(),
      transaction: (rideObj["transactions"] as List<dynamic>)
          .map(
            (transaction) => Transaction(
                status: transaction["status"],
                phoneNumber: transaction["phoneNumber"],
                amount: transaction["amount"],
                passengerId: transaction["passengerId"],
                driverId: transaction["driverId"],
                seatsStr: transaction["seatsStr"],
                dropOffLocation: transaction["exactDropOffLocation"],
                id: transaction["id"]),
          )
          .toList(),
      car: Car(
        licensePlate: rideObj["car"]["licensePlate"],
        imageUrl: rideObj["car"]["imageUrl"],
        color: rideObj["car"]["color"],
        model: rideObj["car"]["model"],
        ownerId: rideObj["car"]["ownerId"],
        id: rideObj["car"]["id"],
        owner: Owner(
            id: rideObj["car"]["owner"]["id"],
            firstName: rideObj["car"]["owner"]["firstName"],
            lastName: rideObj["car"]["owner"]["lastName"],
            userName: rideObj["car"]["owner"]["userName"],
            device: null),
      ),
    );

    setState(() {
      loadedRide = rideData;
    });

    return rideData;
  }
}

class Bookings extends StatefulWidget {
  final Ride? ride;
  final bool? isDriver;
  final bool? isPast;
  Bookings({this.ride, this.isDriver, this.isPast, Key? key}) : super(key: key);

  @override
  _Bookings createState() => _Bookings();
}

class _Bookings extends State<Bookings> {
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    String? status = "";
    String? rideStatus = "";
    List<dynamic> bookings = [];

    for (var i = 0; i < widget.ride!.transaction.length; i++) {
      status = widget.ride!.transaction[i].status;
      if (status == RideStatus.Draft || status == RideStatus.Approved) {
        bookings.add(widget.ride!.transaction[i]);
      }
    }

    if (widget.ride!.transaction.length == 0) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Seems there is nothing here yet.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade400),
              ),
              Icon(
                Icons.directions_car_filled,
                color: Colors.grey.shade400,
                size: 70,
              ),
            ],
          ),
        ),
      );
    }

    return _accountController.verifyingPayment.value
        ? _rideStatusModule(rideStatus)
        : ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return listItem(
                transaction: bookings[index],
                isDriver: widget.isDriver!,
                isPast: widget.isPast!,
                rideId: widget.ride!.id,
                rideStatus: rideStatus,
              );
            },
          );
  }

  Widget listItem({
    required dynamic transaction,
    required bool isDriver,
    required bool isPast,
    required int rideId,
    required String rideStatus,
  }) {
    String id = transaction.passengerId;
    String seatPosition = transaction.seatsStr;
    String transactionId = transaction.id;
    String status = transaction.status;

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Operation(
                  client: _clientController.client,
                  operationRequest: GGetUserByIdReq((b) => b..vars.id = id),
                  builder: (BuildContext context,
                      OperationResponse<GGetUserByIdData, GGetUserByIdVars>?
                          response,
                      Object? erro) {
                    if (response!.loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    String username =
                        '${response.data!.users.isNotEmpty ? response.data!.users.first.userName : 'No username'}';

                    return Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFFFCD00),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(ProfileTap(
                                    userId: id,
                                    isDriver: false,
                                  ));
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                            child: CachedNetworkImage(
                                          imageUrl: getProfileImageUrl(response
                                              .data!
                                              .users
                                              .first
                                              .profilePictureDataUrl),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          fit: BoxFit.fill,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Builder(builder: (context) {
                            return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (response.data!.users.isNotEmpty) {
                                          Get.to(ProfileTap(
                                            userId: id,
                                            isDriver: false,
                                          ));
                                        } else {
                                          Get.snackbar(
                                              "Error", "User not found");
                                        }
                                      },
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: username,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                          TextSpan(text: "\n"),
                                          TextSpan(
                                              text: seatPosition,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black)),
                                        ]),
                                      ),
                                    ),

                                    // second column
                                    // if status is draft, show reject button, for approved show approved text, f
                                    status == RideStatus.Draft
                                        ? Container(
                                            height: 34,
                                            width: 85,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  40.0), // Adjust the radius as needed
                                            ),
                                            child: widget.isDriver == true
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      if (widget.isPast ==
                                                          true) {
                                                        return;
                                                      }
                                                      AlertDialog alert =
                                                          AlertDialog(
                                                        title: Text("Confirm"),
                                                        content: Text(
                                                            "Are you sure you want to reject this booking request?"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text(
                                                              "Yes",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                rideStatus =
                                                                    "Reject";
                                                              });
                                                              _driverRejectBooking(
                                                                  transactionId,
                                                                  widget.ride!);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );

                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return alert;
                                                        },
                                                      );
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          widget.isPast == true
                                                              ? Colors.grey
                                                              : Colors.red,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Reject",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  )
                                                : Text(
                                                    'Pending Approval',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                          )
                                        : Text(
                                            "Approved",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          ),

                                    // third column
                                    // for draft status, show approve button, for approved status, show chat button else show nothing
                                    status == RideStatus.Draft
                                        ? Container(
                                            height: 34,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  40.0), // Adjust the radius as needed
                                            ),
                                            child: widget.isDriver == true
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      if (widget.isPast ==
                                                          true) {
                                                        return;
                                                      }
                                                      AlertDialog alert =
                                                          AlertDialog(
                                                        title: Text("Confirm"),
                                                        content: Text(
                                                            "Are you sure you want to approve this booking request?"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text(
                                                              "Yes",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                rideStatus =
                                                                    "Approve";
                                                              });
                                                              _driverApproveBooking(
                                                                  transactionId,
                                                                  widget.ride!);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );

                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return alert;
                                                        },
                                                      );
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          widget.isPast == true
                                                              ? Colors.grey
                                                              : Colors.green,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Approve",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  )
                                                : Text(
                                                    'Pending Approval',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                          )
                                        : Text(
                                            "Approved",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          ),
                                  ],
                                ));
                          }),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ));
  }

  Future<bool> _driverApproveBooking(String transactionId, Ride ride) async {
    setState(() {
      _accountController.verifyingPayment.value = true;
    });
    var response = await post(
        Uri.parse(Constant.driverApproveBookingUrl + transactionId),
        body: null,
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      _accountController.verifyingPayment = false.obs;
      setState(
        () {
          _accountController.verifyingPayment.value = false;
        },
      );
      Get.snackbar('Success', 'Ride booking approved successfully');

      //remove the transaction from the list
      ride.transaction.removeWhere((element) => element.id == transactionId);
      return true;
    } else {
      Get.snackbar('Failed', 'Ride approval failed, please try again');
      setState(() {
        _accountController.verifyingPayment.value = false;
      });
      return false;
    }
  }

  Future<bool> _driverRejectBooking(String transactionId, Ride ride) async {
    setState(() {
      _accountController.verifyingPayment.value = true;
    });
    var response = await post(
        Uri.parse(Constant.driverRejectBookingUrl + transactionId),
        body: null,
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      _accountController.verifyingPayment = false.obs;
      setState(
        () {
          _accountController.verifyingPayment.value = false;
        },
      );
      Get.snackbar('Success', 'Ride Rejected');

      //remove the transaction from the list
      ride.transaction.removeWhere((element) => element.id == transactionId);
      return true;
    } else {
      Get.snackbar('Failed', 'Ride Rejection failed, please try again');
      setState(() {
        _accountController.verifyingPayment.value = false;
      });
      return false;
    }
  }

  _rideStatusModule(String status) {
    String message = status == "Approve" ? "Approving" : "Rejecting";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Executing your action, Please Wait.')),
        Divider(),
        Card(
          elevation: 15,
          child: Column(
            children: [
              LoadingIndicator(
                  indicatorType: Indicator.ballClipRotateMultiple,
                  colors: const [
                    ColorsRes.gradientOneColor,
                    Colors.green,
                  ],
                  strokeWidth: 2,
                  backgroundColor: Colors.transparent,
                  pathBackgroundColor: Colors.black),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      'Do Not Exit This Page To Complete The Process',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
