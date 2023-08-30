import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/map_trip.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gfl;
import 'package:pamride/pages/mobile/payment_page.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../components/constant.dart';
import '../../graphql/__generated__/operations.data.gql.dart';
import 'chat_page_v2.dart';
import 'taps/profile_tap.dart';

class RideDetailProfile extends StatefulWidget {
  final String rideId;
  final bool? isDriver;
  final bool? isPast;
  final int? draftRides;
  final String? status;
  const RideDetailProfile(
      {Key? key,
      required this.rideId,
      this.isDriver,
      this.isPast,
      this.draftRides,
      this.status})
      : super(key: key);

  @override
  State<RideDetailProfile> createState() => _RideDetailProfileState();
}

class _RideDetailProfileState extends State<RideDetailProfile> {
  DraggableScrollableController _scrollController =
      DraggableScrollableController();
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  double modalSize = 1.0;
  Ride? ride;
  String? rideStatus;
  bool? isRecurring;
  late bool paymentStatus = false;
  late Future<Ride?> rideInfo;

  Future<Ride?> fetchRideData() async {
    final gfl.GraphQLClient client = gfl.GraphQLClient(
      link: await getLinkAndToken(),
      cache: gfl.GraphQLCache(),
    );
    int rideId = int.parse(widget.rideId);
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
          isRecurring
          arrivalTime
          departureTime
          duration
          routeIndex
          exactPickupLocation
          exactDropOffLocation
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
              device {
                id
                deviceRegToken
              }
            }
          }
          transactions{ 
              status
              driverId
              passengerId
              phoneNumber
              amount
              seatsStr
              exactDropOffLocation
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
      isRecurring: rideObj['isRecurring'],
      arrivalTime: rideObj["arrivalTime"],
      duration: rideObj["duration"],
      routeIndex: rideObj["routeIndex"],
      exactPickupLocation: rideObj["exactPickupLocation"],
      exactDropOffLocation: rideObj["exactDropOffLocation"],
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
          device: Device(
            id: rideObj["car"]["owner"]["device"] != null
                ? rideObj["car"]["owner"]["device"]["id"]
                : 0,
            deviceRegToken: rideObj["car"]["owner"]["device"] != null
                ? rideObj["car"]["owner"]["device"]["deviceRegToken"]
                : "",
          ),
        ),
      ),
    );

    setState(() {
      ride = rideData;
    });

    return rideData;
  }

  @override
  void initState() {
    rideInfo = fetchRideData();
    _scrollController.isAttached ? _scrollController.jumpTo(1.0) : null;
    super.initState();
    analytics.setCurrentScreen(screenName: "Ride_detail_profile");
  }

  @override
  Widget build(BuildContext context) {
    if (ride == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
        extendBody: true,
        body: _clientController.switchCar.value == true
            ? MapTrip(
                origin: ride!.placeofStart,
                destination: ride!.destination,
                routeIndex: ride!.routeIndex,
              )
            : Stack(
                children: [
                  MapTrip(
                    origin: ride!.placeofStart,
                    destination: ride!.destination,
                    routeIndex: ride!.routeIndex,
                  ),
                  scroll(),
                ],
              ));
  }

  /// back arrow for navigation in iOS devices
  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  /// the section containing form,to,estimated distance,profile picture,description,PaidPassenger and more information about the ride
  scroll() {
    int draftRidesCount = 0;
    if (widget.draftRides != null) {
      draftRidesCount = widget.draftRides!;
    }

    return DraggableScrollableSheet(
        initialChildSize: modalSize,
        maxChildSize: 1.0,
        minChildSize: 0.05,
        controller: _scrollController,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),

                  ///From and To
                  ///
                  Text(
                    'From ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Text(
                    ride!.placeofStart,
                    style: TextStyle(color: Colors.black45),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    'To ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Text(
                    ride!.destination,
                    style: TextStyle(color: Colors.black45),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    'Estimated Distance ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Text(
                    ride!.estimatedDistance.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black45),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  /// pass the context and the owner id to this method
                  /// owner id comes from the rides
                  profile(context, ride!.car.ownerId),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ProfileTap(
                            userId: ride!.car.ownerId,
                            isDriver: true,
                          ));
                        },
                        child: Container(
                          height: 30.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'View Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return VehicleDetailsDialog(
                                vehicleRegistration: ride!.car.licensePlate,
                                model: ride!.car.model,
                                color: ride!.car.color,
                                images: [getCarImageUrl(ride!.car.imageUrl)],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 30.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'View Car',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.isDriver == true ||
                              widget.status != RideStatus.Paid ||
                              widget.isPast == true) {
                            return;
                          }

                          String fromUser = _accountController.userName.string;
                          String toUser = ride!.car.owner.userName;
                          String deviceRegToken = ride!.car.owner.device != null
                              ? ride!.car.owner.device!.deviceRegToken!
                              : '';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPageV2(
                                fromUser: fromUser,
                                toUser: toUser,
                                deviceRegistrationToken: deviceRegToken,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 30.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: widget.isPast == true
                                ? Colors.grey
                                : widget.isDriver == true
                                    ? Colors.grey
                                    : widget.status == RideStatus.Paid
                                        ? Colors.green
                                        : Colors.grey,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Chat',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Paid Passengers",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: (ride!.seat.frontLeft == "" ||
                            ride!.seat.frontLeft == "NA") &&
                        (ride!.seat.middleLeft == "" ||
                            ride!.seat.middleLeft == "NA") &&
                        (ride!.seat.middleCentre == "" ||
                            ride!.seat.middleCentre == "NA") &&
                        (ride!.seat.middleRight == "" ||
                            ride!.seat.middleRight == "NA") &&
                        (ride!.seat.backLeft == "" ||
                            ride!.seat.backLeft == "NA") &&
                        (ride!.seat.backCentre == "" ||
                            ride!.seat.backCentre == "NA") &&
                        (ride!.seat.backRight == "" ||
                            ride!.seat.backRight == "NA"),
                    child: Text(
                      'No passengers have booked this trip yet.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black45),
                    ),
                  ),

                  Visibility(
                    visible: ride!.seat.frontLeft != "" &&
                        ride!.seat.frontLeft != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.frontLeft, 'Front Left', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.middleLeft != "" &&
                        ride!.seat.middleLeft != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.middleLeft, 'Middle Left', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.middleCentre != "NA" &&
                        ride!.seat.middleCentre != "",
                    child: PaidPassenger(context, ride!.seat.middleCentre,
                        'Middle Centre', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.middleRight != "" &&
                        ride!.seat.middleRight != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.middleRight, 'Middle Right', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.backLeft != "" &&
                        ride!.seat.backLeft != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.backLeft, 'Back Left', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.backCentre != "" &&
                        ride!.seat.backCentre != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.backCentre, 'Back Centre', ride),
                  ),
                  Visibility(
                    visible: ride!.seat.backRight != "" &&
                        ride!.seat.backRight != "NA",
                    child: PaidPassenger(
                        context, ride!.seat.backRight, 'Back Right', ride),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Departure Date & Time",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  /// display the departure time of the trip
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getFormatedDateTime(
                            DateTime.parse(ride!.departureDate).toLocal()),
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Exact pickup location",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ride?.exactPickupLocation ?? 'NA',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Exact stop location",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ride?.exactDropOffLocation ?? 'NA',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  /// a brief description of the ride
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'This trip is estimated to take ${ride!.duration}. \nCurrent available seats are:\n${ride!.seat.backLeft == "" ? 'Back Left' : ''}${ride!.seat.backRight == "" ? ', Back Right' : ''}${ride!.seat.backCentre == "" ? ', Back Center' : ''}${ride!.seat.middleCentre == "" ? ', Middle Centre' : ''}${ride!.seat.middleRight == "" ? ', Middle Right' : ''} ${ride!.seat.middleLeft == "" ? ', Middle Left' : ''}${ride!.seat.frontLeft == "" ? ', Front Left' : ''}.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black45),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "More information",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  /// display more information about the ride (allowed behaviour description)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 1,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Text(
                      ride!.allowedBehDesc == null
                          ? "There is no \"more information\" about this ride"
                          : ride!.allowedBehDesc.toString(),
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                      child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height: 4,
                        ),
                      ),
                      Text(
                        "Is Recurring",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      // if recuring
                      FormBuilderCheckbox(
                        name: 'isRecurring',
                        initialValue: ride!.isRecurring == null
                            ? false
                            : ride!.isRecurring,
                        onChanged: (value) {
                          setState(() {
                            isRecurring = value;
                            HttpHelper().driverHandleRecurringRide(
                                rideId: ride!.id, state: isRecurring!);
                          });
                        },
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Can this ride repeat itself? ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Recurring ride'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'What is a recurring ride?'),
                                                SizedBox(height: 8.0),
                                                Text(
                                                    '- A ride that repeats itself on a weekly basis, say every friday at 5 pm when going home from work.'),
                                                SizedBox(height: 16.0),
                                                Text(
                                                    'Can I cancel a recurring ride?'),
                                                Text(
                                                    '- On the ride details page, you can cancel a recurring ride by unchecking the recurring checkbox and saving the ride.'),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                text: '(Learn more)',
                                style: TextStyle(
                                    color: ColorsRes.gradientTwoColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }

  profile(BuildContext context, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Operation(
          client: _clientController.client,
          operationRequest: GGetUserByIdReq((b) => b..vars.id = id),
          builder: (BuildContext context,
              OperationResponse<GGetUserByIdData, GGetUserByIdVars>? response,
              Object? erro) {
            if (response!.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(ProfileTap(
                        userId: id,
                        isDriver: true,
                      ));
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFFFCD00),
                        child: Container(
                          height: 120,
                          width: 120,
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
                                      .data!.users.first.profilePictureDataUrl),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.fill,
                                )),
                              ],
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride!.car.owner.firstName.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: mainText),
                      ),
                      Text("Verified driver",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => MapTrip(
                          origin: ride!.placeofStart.toString(),
                          destination: ride!.destination.toString(),
                          routeIndex: ride!.routeIndex,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.map,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Map",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: mainText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  PaidPassenger(
      BuildContext context, String? id, String seatPosition, Ride? ride) {
    String? status = "";
    String transactionId = "";
    String transactionPhonenumber = "";
    String exactDropOffLocation = "";

    for (var i = 0; i < ride!.transaction.length; i++) {
      String seatStr = ride.transaction[i].seatsStr;
      if (id!.length > 5) {
        String compactSeatPosition = seatPosition.replaceAll(" ", "");
        if (seatStr.contains(compactSeatPosition)) {
          status = ride.transaction[i].status;
          transactionId = ride.transaction[i].id;
          transactionPhonenumber = ride.transaction[i].phoneNumber;
          exactDropOffLocation = ride.transaction[i].dropOffLocation!;
          if (status == RideStatus.Paid) {
            break;
          }
        }
      }
    }

    return Padding(
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
                String devRegToken = response.data!.users.first.device != null
                    ? response.data!.users.first.device!.deviceRegToken
                    : '';

                return Container(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFFFCD00),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ProfileTap(
                                  userId: id!,
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
                                          userId: id!,
                                          isDriver: false,
                                        ));
                                      } else {
                                        Get.snackbar("Error", "User not found");
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
                                          width: 75,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                40.0), // Adjust the radius as needed
                                          ),
                                          child: widget.isDriver == true
                                              ? ElevatedButton(
                                                  onPressed: () {
                                                    if (widget.isPast == true) {
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
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              rideStatus =
                                                                  "Reject";
                                                            });
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
                                                          BorderRadius.circular(
                                                              40.0),
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
                                                  username.length > 12
                                                      ? 'Pending \nApproval'
                                                      : 'Pending Approval',
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                        )
                                      : status == RideStatus.Approved
                                          ? Text(
                                              "Approved",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.green),
                                            )
                                          : status == RideStatus.Paid
                                              ? Text(
                                                  "Paid",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.green),
                                                )
                                              : status ==
                                                      RideStatus
                                                          .Rejected // check a bug here for logic when passenger books ride gets rejected and books same seat again
                                                  ? Text(
                                                      'Rejected',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.red),
                                                    )
                                                  : Container(),

                                  // third column
                                  // for draft status, show approve button, for approved status, show chat button else show nothing
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
                                                    if (widget.isPast == true) {
                                                      return;
                                                    }
                                                    setState(() {
                                                      rideStatus = "Approve";
                                                    });
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        widget.isPast == true
                                                            ? Colors.grey
                                                            : Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
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
                                              : Container(
                                                  height: 24,
                                                  width: 65,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0), // Adjust the radius as needed
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.grey,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Chat",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                ))
                                      : status == RideStatus.Approved
                                          ? widget.isDriver == false
                                              ? Container(
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (widget.isPast ==
                                                            true) {
                                                          return;
                                                        }
                                                        if (_accountController
                                                                .accountId
                                                                .value !=
                                                            id) {
                                                          return;
                                                        }
                                                        Get.to(
                                                          () => PaymentPage(
                                                            ride: ride,
                                                            transactionId:
                                                                transactionId,
                                                            transactionPhoneNumber:
                                                                transactionPhonenumber,
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 28,
                                                        width: 80,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 3,
                                                                bottom: 3,
                                                                left: 5,
                                                                right: 5),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: DesignConfig
                                                            .buttonShadowColor(
                                                                widget.isPast ==
                                                                        true
                                                                    ? Colors
                                                                        .grey
                                                                    : ColorsRes
                                                                        .gradientTwoColor,
                                                                37,
                                                                widget.isPast ==
                                                                        true
                                                                    ? Colors
                                                                        .grey
                                                                    : _accountController.accountId.value ==
                                                                            id
                                                                        ? Colors
                                                                            .orange
                                                                        : ColorsRes
                                                                            .blackTransparentColor),
                                                        child: Text(
                                                          'PAY NOW',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Roboto"),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Text(
                                                  username.length > 12
                                                      ? 'Pending \nPayment'
                                                      : 'Pending Payment',
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.amber),
                                                )
                                          : status == RideStatus.Paid
                                              ? Container(
                                                  height: 24,
                                                  width: 65,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0), // Adjust the radius as needed
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      if (widget.isDriver ==
                                                          false) {
                                                        return;
                                                      }

                                                      String fromUser =
                                                          _accountController
                                                              .userName.string;
                                                      String toUser = username;
                                                      String driverName = ride
                                                          .car.owner.userName
                                                          .toString();

                                                      if (fromUser == toUser &&
                                                          fromUser !=
                                                              driverName) {
                                                        toUser = driverName;
                                                      }

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChatPageV2(
                                                                  fromUser:
                                                                      fromUser,
                                                                  toUser:
                                                                      toUser,
                                                                  deviceRegistrationToken:
                                                                      devRegToken),
                                                        ),
                                                      );
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          widget.isDriver ==
                                                                  true
                                                              ? Colors.green
                                                              : Colors.grey,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Chat",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                )
                                              : status == RideStatus.Rejected
                                                  ? ElevatedButton(
                                                      onPressed: () {},
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Chat",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    )
                                                  : Container()
                                ],
                              ));
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Drop Off: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          exactDropOffLocation.length < 30
                              ? exactDropOffLocation
                              : exactDropOffLocation.substring(0, 30) + "...",
                          style: TextStyle(fontSize: 14),
                          softWrap: true,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )
                  ],
                ));
              }),
        ],
      ),
    );
  }

  PendingPassengers(BuildContext context, Ride? ride) {
    String? status = "";
    List<dynamic> bookings = [];

    for (var i = 0; i < ride!.transaction.length; i++) {
      status = ride.transaction[i].status;
      if (status == RideStatus.Draft || status == RideStatus.Approved) {
        bookings.add(ride.transaction[i]);
      }
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (BuildContext context, int index) {
        dynamic transaction = bookings[index];
        String seatPosition = transaction['seatsStr'];
        return listItem(transaction: transaction);
      },
    );
  }

  Widget listItem({required dynamic transaction}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 2,
      child: Text("Pamride"),
    );
  }

  Info(BuildContext context, int index, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: mainText,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  info,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: mainText),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
  //This module shows up when the user has a pending payment process.
}

class VehicleDetailsDialog extends StatelessWidget {
  final String vehicleRegistration;
  final String color;
  final String model;

  final List<String> images;

  const VehicleDetailsDialog(
      {required this.vehicleRegistration,
      required this.images,
      required this.color,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsRes.gradientOneColor, width: 0.5),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CachedNetworkImage(
                  imageUrl: getCarImageUrl(images.first),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Plate NO:'),
                    Text('Color:'),
                    Text('Model:'),
                  ],
                ),
              ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$vehicleRegistration'),
                  Text('$color'),
                  Text(
                    model,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => ColorsRes.gradientTwoColor),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}

class Ride {
  final String allowedBehDesc;
  final int id;
  final String name;
  final String departureDate;
  final String departureTime;
  final String placeofStart;
  final String destination;
  final String estimatedDistance;
  final int numberOfPeople;
  final int maximumCarryWeight;
  final String status;
  final String arrivalTime;
  final String duration;
  final int routeIndex;
  final String exactPickupLocation;
  final String exactDropOffLocation;
  final Seat seat;
  final double totalPay;
  final double maxTotalPay;
  final int seatCount;
  final int seatCapacity;
  final double estimatePrice;
  final List<User> users;
  final Car car;
  final List<Transaction> transaction;
  final bool? isRecurring;

  Ride(
      {required this.allowedBehDesc,
      required this.id,
      required this.name,
      required this.departureDate,
      required this.departureTime,
      required this.placeofStart,
      required this.destination,
      required this.estimatedDistance,
      required this.numberOfPeople,
      required this.maximumCarryWeight,
      required this.status,
      required this.arrivalTime,
      required this.duration,
      required this.routeIndex,
      required this.exactPickupLocation,
      required this.exactDropOffLocation,
      required this.seat,
      required this.totalPay,
      required this.maxTotalPay,
      required this.seatCount,
      required this.seatCapacity,
      required this.estimatePrice,
      required this.users,
      required this.car,
      required this.transaction,
      this.isRecurring});
}

class Seat {
  final String id;
  final String backLeft;
  final String frontLeft;
  final String backCentre;
  final String backRight;
  final String middleLeft;
  final String middleRight;
  final String middleCentre;

  Seat({
    required this.id,
    required this.backLeft,
    required this.frontLeft,
    required this.backCentre,
    required this.backRight,
    required this.middleLeft,
    required this.middleRight,
    required this.middleCentre,
  });
}

class User {
  final int userId;
  final UserDetail user;

  User({
    required this.userId,
    required this.user,
  });
}

class UserDetail {
  final String id;
  final String userName;
  final String profilePictureDataUrl;

  UserDetail({
    required this.id,
    required this.userName,
    required this.profilePictureDataUrl,
  });
}

class Car {
  final String licensePlate;
  final String imageUrl;
  final String color;
  final String model;
  final String ownerId;
  final String id;
  final Owner owner;

  Car({
    required this.licensePlate,
    required this.imageUrl,
    required this.color,
    required this.model,
    required this.ownerId,
    required this.id,
    required this.owner,
  });
}

class Owner {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final Device? device;

  Owner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.device,
  });
}

class Transaction {
  final String status;
  final String phoneNumber;
  final int amount;
  final String passengerId;
  final String driverId;
  final String seatsStr;
  final String? dropOffLocation;
  final String id;

  Transaction({
    required this.status,
    required this.phoneNumber,
    required this.amount,
    required this.passengerId,
    required this.driverId,
    required this.seatsStr,
    required this.dropOffLocation,
    required this.id,
  });
}

class Device {
  final int? id;
  final String? deviceRegToken;

  Device({
    required this.id,
    required this.deviceRegToken,
  });
}
