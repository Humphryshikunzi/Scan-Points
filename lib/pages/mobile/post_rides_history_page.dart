import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/map_screen.dart';
import 'package:pamride/pages/mobile/map_trip.dart';
import 'package:pamride/pages/mobile/pending_passengers.dart';
import 'package:pamride/pages/mobile/ride_details_profile.dart';
import 'package:pamride/widgets/Alert.dart';
import 'package:pamride/widgets/DialogButton.dart';
import 'package:pamride/widgets/constants.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/account_controller.dart';

AccountController _accountController = Get.find<AccountController>();

class PostRideHistoryPage extends StatefulWidget {
  @override
  _PostRideHistoryPageState createState() => _PostRideHistoryPageState();
}

class _PostRideHistoryPageState extends State<PostRideHistoryPage> {
  ClientController _clientController = Get.find();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  String userID = "";

  /// function to get the user id
  void getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userIDPef = sharedPreferences.getString("accountId");
    setState(() {
      userID = userIDPef.toString();
    });
  }

  /// initial function of the screeN
  @override
  void initState() {
    _clientController.clearCache();
    getUserID();
    super.initState();
    analytics.setCurrentScreen(screenName: "Post Ride History");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
                          'Trips Information',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Column(
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
                    /// listing the Travel history tabs (On Going Trips,Past Trips and Paid Trips)
                    Tab(
                      child: Container(
                        child: Text(
                          "Active",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Past",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primary.withOpacity(0.1)),
                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                  labelColor: primary,
                ),
              ),

              /// list the implementation of all the tabs
              Expanded(
                child: TabBarView(children: [
                  OnGoing(userID),
                  PastTrips(userID),
                ]),
              ),
            ],
          ),
        ));
  }
}

/// this class is used to dispal the active trips
class OnGoing extends StatefulWidget {
  String userID = "";
  OnGoing(this.userID, {Key? key}) : super(key: key);
  @override
  _OnGoingState createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  final getRidesQuery = gql('''
      query GetActiveTrips(\$ownerId: String!,\$currentDateTime:DateTime) {
        rides(
          where: {
            status: { eq: "Active" }
            car: {ownerId: {eq: \$ownerId}} 
            arrivalTime: {gte: \$currentDateTime}
          }
          order: {arrivalTime:ASC}
        ) {
          id
          name
          departureDate
          departureTime
          destination
          estimatedDistance
          numberOfPeople
          maximumCarryWeight
          placeofStart
          status
          duration
          routeIndex
          totalPay
          maxTotalPay
          arrivalTime
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
          car {
            licensePlate
          }
          transactions{ 
          status
          driverId
          passengerId
          phoneNumber
          amount
          seatsStr
          id
          checkoutRequestId
        }
        }         
      }
    ''');

  bool refreshPage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: getRidesQuery,
        variables: {
          'ownerId': widget.userID,
          "currentDateTime": dartDateToCSharpDate(DateTime.now())
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final allRides = result.data?['rides'] as List<dynamic>;
        final List<dynamic> rides = [];

        for (var ride in allRides) {
          DateTime arrivalTime =
              DateTime.parse(ride["arrivalTime"].toString()).toLocal();
          if (arrivalTime.isAfter(DateTime.now())) {
            rides.add(ride);
          }
        }

        /// if there are rides then return them
        if (rides.length != 0) {
          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              final ride = rides[index];

              DateTime departureDate =
                  DateTime.parse(ride["departureDate"].toString()).toLocal();
              String rideId = ride['id'].toString();
              dynamic transactions = ride['transactions'];

              int draftRides = 0;
              int approvedRides = 0;
              int paidRides = 0;
              transactions.forEach((element) {
                if (element['status'] == "Draft") {
                  draftRides++;
                }
                if (element['status'] == "Approved") {
                  approvedRides++;
                }
                if (element['status'] == "Paid") {
                  paidRides++;
                }
              });

              return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => {
                        Get.to(
                          () => RideDetailProfile(
                            rideId: rideId,
                            isDriver: true,
                            isPast: false,
                            draftRides: draftRides,
                          ),
                        )
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ride Id: #" + rideId),
                              Text(
                                getFormatedDateTime(departureDate),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                  color: Colors.red,
                                ),
                              ),
                              Text('From: ',
                                  style: TextStyle(color: Colors.red)),
                              Expanded(
                                  child: ride['placeofStart']
                                              .toString()
                                              .length >
                                          28
                                      ? Text(ride['placeofStart']
                                              .toString()
                                              .substring(0, 28) +
                                          '...')
                                      : Text(ride['placeofStart'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                              ),
                              Text('To: ',
                                  style: TextStyle(color: Colors.green)),
                              ride['destination'].toString().length > 30
                                  ? Text(
                                      ride['destination']
                                              .toString()
                                              .substring(0, 30) +
                                          '...',
                                    )
                                  : Text(
                                      ride['destination'].toString(),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Your Maximum Amount:\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(),
                                          ),
                                          TextSpan(
                                            text: 'KES ' +
                                                ride['maxTotalPay']
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                              color:
                                                  primary, // Replace `primary` with the desired color
                                              fontSize:
                                                  16, // Specify the desired font size
                                              fontWeight: FontWeight
                                                  .w400, // Specify the desired font weight
                                              // Add any other desired text style properties
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Current Amount:\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(),
                                          ),
                                          TextSpan(
                                            text: 'KES ' +
                                                ride['totalPay']
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                              color:
                                                  primary, // Replace `primary` with the desired color
                                              fontSize:
                                                  16, // Specify the desired font size
                                              fontWeight: FontWeight
                                                  .w400, // Specify the desired font weight
                                              // Add any other desired text style properties
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Passengers Booking Status: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Pending Approval ($draftRides)\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      elevation: 2,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Material(
                                        color: draftRides == 0
                                            ? Colors.grey
                                            : Colors
                                                .orangeAccent, // Set the desired background color here
                                        child: Container(
                                          height: 22,
                                          width: 70,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          padding: EdgeInsets.only(
                                              top: 3, bottom: 3),
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (draftRides == 0) {
                                                return;
                                              }
                                              setState(() {
                                                refreshPage = true;
                                              });
                                              Get.to(BookingsPage(
                                                rideId: rideId,
                                                isDriver: true,
                                                isPast: false,
                                                draftRides: draftRides,
                                              ));
                                            },
                                            child: Text(
                                              "Approve",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Paid ($paidRides)\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      elevation: 2,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Material(
                                        color: paidRides == 0
                                            ? Colors.grey
                                            : Colors
                                                .greenAccent, // Set the desired background color here
                                        child: Container(
                                          height: 22,
                                          width: 70,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => RideDetailProfile(
                                                  rideId: rideId,
                                                  isDriver: true,
                                                  isPast: false,
                                                  draftRides: draftRides,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "View",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                child: Text(
                                  'Cancel Trip',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  List<String> seatsToCancel = [];

                                  if (ride['seat']['frontLeft'] != "NA")
                                    seatsToCancel.add('FrontLeft');

                                  if (ride['seat']['middleLeft'] != "NA")
                                    seatsToCancel.add('MiddleLeft');

                                  if (ride['seat']['middleCentre'] != "NA")
                                    seatsToCancel.add('MiddleCentre');

                                  if (ride['seat']['middleRight'] != "NA")
                                    seatsToCancel.add('MiddleRight');

                                  if (ride['seat']['backLeft'] != "NA")
                                    seatsToCancel.add('BackLeft');

                                  if (ride['seat']['backCentre'] != "NA")
                                    seatsToCancel.add('BackCentre');

                                  if (ride['seat']['backRight'] != "NA")
                                    seatsToCancel.add('BackRight');

                                  _driverCancelBooking(context,
                                      driverId:
                                          _accountController.accountId.string,
                                      rideId: ride['id'].toString(),
                                      seats: seatsToCancel);
                                },
                              ),
                              TextButton(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Map',
                                      style: TextStyle(color: fontLight),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.map,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Get.to(() => MapTrip(
                                      origin: ride['placeofStart'].toString(),
                                      destination:
                                          ride['destination'].toString(),
                                      routeIndex: ride["routeIndex"] ?? 0));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        }

        /// if there are no paid rides then return this notification
        else {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You have not created a ride yet",
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
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MapScreen(myCars: _accountController.myCars),
                        ),
                      )
                    },
                    child: Text("Create a ride"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _driverCancelBooking(context,
      {required String driverId,
      required String rideId,
      required List<String> seats}) {
    TextEditingController _reasonEditingController = TextEditingController();
    Alert(
      context: context,
      type: AlertType.info,
      title: "Ride Cancellation",
      content: TextField(
        keyboardType: TextInputType.text,
        controller: _reasonEditingController,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: 'Enter a reason for cancellation',
        ),
        cursorColor: ColorsRes.gradientOneColor,
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            "Back",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          gradient: LinearGradient(colors: [ColorsRes.white, ColorsRes.white]),
        ),
        DialogButton(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            if (_reasonEditingController.text.isEmpty) {
              _reasonEditingController.text = '';
            }
            HttpHelper().driverCancelBooking(
              driverId: driverId,
              rideId: rideId,
              reason: _reasonEditingController.text,
              seats: seats,
              isCancelled: true,
            );
            Navigator.of(context, rootNavigator: true).pop('dialog');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => HomePage(
                        activePage: 0,
                      )),
            );
          },
          gradient: LinearGradient(colors: [Colors.red, Colors.redAccent]),
        ),
      ],
    ).show();
  }
}

/// this class is used to build the past trips page
class PastTrips extends StatefulWidget {
  String userID = "";
  PastTrips(this.userID, {Key? key}) : super(key: key);
  @override
  _PastTripsState createState() => _PastTripsState();
}

class _PastTripsState extends State<PastTrips> {
  final getRidesQuery = gql('''
  query GetPastTrips(\$ownerId: String!, \$currentDateTime:DateTime) {
    rides(
      where: {  
        car: {ownerId: {eq: \$ownerId}}   
        arrivalTime: {lt: \$currentDateTime}
      }
      order: {arrivalTime:DESC}
    ) {
      id
      name
      departureDate
      destination
      estimatedDistance
      numberOfPeople
      maximumCarryWeight
      placeofStart 
      status
      duration
      totalPay
      arrivalTime
      car {
        licensePlate
      }
      transactions { 
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
  ''');

  /// initial function of the screen
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: getRidesQuery,
        variables: {
          "ownerId": widget.userID,
          "currentDateTime": dartDateToCSharpDate(DateTime.now())
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final rides = result.data?['rides'] as List<dynamic>;

        /// if there are rides then return them
        if (rides.length != 0) {
          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              final ride = rides[index];
              final dateTime = DateTime.parse(ride['departureDate']).toLocal();
              final formattedDate = getFormatedDateTime(dateTime);

              String rideId = ride["id"].toString();
              String rideStatus = ride["status"];
              String totalPay = ride["totalPay"].toString();
              double totalPayAmount = double.parse(totalPay);
              String destination = ride['destination'].toString().length > 30
                  ? ride['destination'].toString().substring(0, 30) + '...'
                  : ride['destination'].toString();
              String placeOfStart = ride['placeofStart'].toString().length > 28
                  ? ride['placeofStart'].toString().substring(0, 28) + '...'
                  : ride['placeofStart'].toString();
              String? amount = ride['totalPay'].toStringAsFixed(2).toString();
              String? duration = ride['duration'].toString();
              String? travelTime =
                  getDartDateFromCSharpDate(ride['departureDate'])
                      .toString()
                      .substring(0, 16);
              String? paymentMethod = "MPesa";
              String? licensePlate = ride['car']['licensePlate'].toString();
              String? distance = ride['estimatedDistance'].toString();

              if (totalPayAmount > 0 && rideStatus == "Active") {
                rideStatus = RideStatus.PendingPayment;
              }

              return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () => {
                          Get.to(
                            () => RideDetailProfile(
                              rideId: rideId,
                              isDriver: true,
                              isPast: true,
                            ),
                          )
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ride Id: #" + ride['id'].toString()),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Collected: KES " + amount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.green, fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: Colors.red,
                                  ),
                                ),
                                Text('From: ',
                                    style: TextStyle(color: Colors.red)),
                                Expanded(child: Text(placeOfStart)),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                                Text('To: ',
                                    style: TextStyle(color: Colors.green)),
                                Expanded(child: Text(destination)),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              formattedDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: primary),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            rideStatus == RideStatus.Paid
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.snackbar('Print Receipt',
                                                'Printing receipt...');

                                            double width =
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5;
                                            downloadDriverReceipt(
                                                driverName: _accountController
                                                        .firstName.value +
                                                    ' ' +
                                                    _accountController
                                                        .lastName.value,
                                                amount: amount,
                                                destination: destination,
                                                pickupLocation: placeOfStart,
                                                rideId: rideId,
                                                distance: distance,
                                                plateNo: licensePlate,
                                                duration: duration,
                                                travelTime: travelTime,
                                                paymentMethod: paymentMethod,
                                                width: width);
                                          },
                                          child: Text(
                                            "Print Receipt",
                                            style:
                                                TextStyle(color: Colors.orange),
                                          )),
                                      getStatusWidget(rideStatus),
                                    ],
                                  )
                                : Center(
                                    child: getStatusWidget(rideStatus),
                                  )
                          ],
                        ),
                      )));
            },
          );
        }

        /// if there are no paid rides then return this notification
        else {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You do not have past rides",
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
    );
  }

//  Function to return the appropriate status widget based on rideStatus
  Widget getStatusWidget(String rideStatus) {
    switch (rideStatus) {
      case RideStatus.Draft:
        return Text(
          "Ride Unbooked",
          style: TextStyle(color: Colors.blue),
        );
      case RideStatus.PendingPayment:
        return Text(
          "Pending Payment",
          style: TextStyle(color: Colors.orange),
        );
      case RideStatus.Paid:
        return Text(
          "Paid",
          style: TextStyle(color: Colors.green),
        );
      case RideStatus.Completed:
        return Text(
          "Completed",
          style: TextStyle(color: Colors.green),
        );
      case RideStatus.Cancelled:
        return Text(
          "Cancelled",
          style: TextStyle(color: Colors.red),
        );
      case RideStatus.Suspended:
        return Text(
          "Suspended",
          style: TextStyle(color: Colors.red),
        );
      default:
        return Text(
          "Ride was not booked!",
          style: TextStyle(color: Color.fromARGB(255, 244, 209, 54)),
        );
    }
  }
}
