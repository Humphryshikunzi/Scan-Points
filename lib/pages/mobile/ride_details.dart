import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/pages/mobile/checkout_page.dart';
import 'package:pamride/pages/mobile/edit_profile_page.dart';
import 'package:pamride/pages/mobile/map_trip.dart';
import 'package:pamride/pages/mobile/ride_details_profile.dart';
import 'package:pamride/pages/mobile/taps/profile_tap.dart';
import 'package:pamride/widgets/car_seats_bg.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../components/constant.dart';
import '../../graphql/__generated__/operations.data.gql.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gfl;

class RideDetail extends StatefulWidget {
  final GGetRidesData_rides? ride;
  final DateTime departureDate;

  const RideDetail({
    Key? key,
    required this.ride,
    required this.departureDate,
  }) : super(key: key);

  @override
  State<RideDetail> createState() => _RideDetailState();
}

class _RideDetailState extends State<RideDetail> {
  DraggableScrollableController _scrollController =
      DraggableScrollableController();
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  double modalSize = 1.0;
  Ride? ride;

  @override
  void initState() {
    _scrollController.isAttached ? _scrollController.jumpTo(1.0) : null;
    fetchRideData();
    super.initState();
  }

  Future<Ride?> fetchRideData() async {
    final gfl.GraphQLClient client = gfl.GraphQLClient(
      link: await getLinkAndToken(),
      cache: gfl.GraphQLCache(),
    );
    int rideId = widget.ride!.id;
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
                : '',
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
      appBar: AppBar(
        leading: buttonArrow(context),
        backgroundColor: ColorsRes.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              _accountController.cartAmount.value =
                  widget.ride!.estimatePrice.toString();
              _accountController.rideId.value = widget.ride!.id.toString();

              if (_accountController.profileImage.value!.isEmpty ||
                  _accountController.profileImage.value!.length < 2) {
                AlertDialog alert = AlertDialog(
                  title: Text("Alert!", style: TextStyle(color: Colors.red)),
                  content: Text(
                      "For security reasons, please upload a profile picture before booking a trip"),
                  actions: [
                    TextButton(
                      child: Text(
                        "Not now",
                        style: TextStyle(color: Colors.orange),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Upload now",
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Get.to(() => EditProfilePage());
                      },
                    ),
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              } else {
                Get.to(
                  () => CheckoutPage(
                    ride: widget.ride!,
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BOOK TRIP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => _clientController.switchCar.value == true
            ? CarSeatsBirdView(ride: widget.ride!)
            : Stack(
                children: [
                  CarSeatsBirdView(ride: widget.ride!),
                  scroll(),
                ],
              ),
      ),
    );
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

  /// the section containing form,to,estimated distance,profile picture,description,passengers and more information about the ride
  scroll() {
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

                  Center(
                    child: InkWell(
                      onTap: () {
                        _accountController.cartAmount.value =
                            widget.ride!.estimatePrice.toString();
                        _accountController.rideId.value =
                            widget.ride!.id.toString();
                        if (_accountController.profileImage.value!.isEmpty ||
                            _accountController.profileImage.value!.length < 2) {
                          AlertDialog alert = AlertDialog(
                            title: Text("Notice!",
                                style: TextStyle(color: Colors.red)),
                            content: Text(
                                "Please upload your profile picture before booking a trip"),
                            actions: [
                              TextButton(
                                child: Text(
                                  "Not now",
                                  style: TextStyle(color: Colors.orange),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Upload now",
                                  style: TextStyle(color: Colors.green),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Get.to(() => EditProfilePage());
                                },
                              ),
                            ],
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              });
                        } else {
                          Get.to(
                            () => CheckoutPage(
                              ride: widget.ride!,
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(bottom: 20.0),
                        alignment: Alignment.center,
                        decoration: DesignConfig.buttonShadowColor(
                            ColorsRes.gradientTwoColor,
                            37,
                            ColorsRes.gradientOneColor),
                        child: Text(
                          'BOOK TRIP',
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsRes.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ),

                  ///From and To
                  ///
                  Text(
                    'From ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  Text(
                    widget.ride!.placeofStart!,
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
                    widget.ride!.destination!,
                    style: TextStyle(color: Colors.black45),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  /// estimated distance

                  Text(
                    'Estimated Distance ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    widget.ride!.estimatedDistance.toString(),
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
                  profile(context, widget.ride!.car!.ownerId),

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
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Profile details',
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
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Vehicle details',
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
                        getFormatedDateTime(widget.departureDate),
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
                        widget.ride?.exactPickupLocation ?? 'NA',
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
                        widget.ride?.exactDropOffLocation ?? 'NA',
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
                    'This trip is estimated to take ${widget.ride!.duration}. \nCurrent available seats are:\n${widget.ride!.seat?.backLeft == "" ? 'Back Left' : ''}${widget.ride!.seat?.backRight == "" ? ', Back Right' : ''}${widget.ride!.seat?.backCentre == "" ? ', Back Center' : ''}${widget.ride!.seat?.middleCentre == "" ? ', Middle Centre' : ''}${widget.ride!.seat?.middleRight == "" ? ', Middle Right' : ''} ${widget.ride!.seat?.middleLeft == "" ? ', Middle Left' : ''}${widget.ride!.seat?.frontLeft == "" ? ', Front Left' : ''}.',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Passengers",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: (widget.ride!.seat?.frontLeft == "" ||
                            widget.ride!.seat?.frontLeft == "NA") &&
                        (widget.ride!.seat?.middleLeft == "" ||
                            widget.ride!.seat?.middleLeft == "NA") &&
                        (widget.ride!.seat?.middleCentre == "" ||
                            widget.ride!.seat?.middleCentre == "NA") &&
                        (widget.ride!.seat?.middleRight == "" ||
                            widget.ride!.seat?.middleRight == "NA") &&
                        (widget.ride!.seat?.backLeft == "" ||
                            widget.ride!.seat?.backLeft == "NA") &&
                        (widget.ride!.seat?.backCentre == "" ||
                            widget.ride!.seat?.backCentre == "NA") &&
                        (widget.ride!.seat?.backRight == "" ||
                            widget.ride!.seat?.backRight == "NA"),
                    child: Text(
                      'No passengers have booked this trip yet.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black45),
                    ),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.frontLeft != "" &&
                        widget.ride!.seat?.frontLeft != "NA",
                    child: passengers(context,
                        widget.ride!.seat?.frontLeft ?? '', 'Front Left', ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.middleLeft != "" &&
                        widget.ride!.seat?.middleLeft != "NA",
                    child: passengers(
                        context,
                        widget.ride!.seat?.middleLeft ?? '',
                        'Middle Left',
                        ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.middleCentre != "NA" &&
                        widget.ride!.seat?.middleCentre != "",
                    child: passengers(
                        context,
                        widget.ride!.seat?.middleCentre ?? '',
                        'Middle Center',
                        ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.middleRight != "" &&
                        widget.ride!.seat?.middleRight != "NA",
                    child: passengers(
                        context,
                        widget.ride!.seat?.middleRight ?? '',
                        'Middle Right',
                        ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.backLeft != "" &&
                        widget.ride!.seat?.backLeft != "NA",
                    child: passengers(context,
                        widget.ride!.seat?.backLeft ?? '', 'Back Left', ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.backCentre != "" &&
                        widget.ride!.seat?.backCentre != "NA",
                    child: passengers(
                        context,
                        widget.ride!.seat?.backCentre ?? '',
                        'Back Center',
                        ride),
                  ),
                  Visibility(
                    visible: widget.ride!.seat?.backRight != "" &&
                        widget.ride!.seat?.backRight != "NA",
                    child: passengers(context,
                        widget.ride!.seat?.backRight ?? '', 'Back Right', ride),
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
                      widget.ride!.allowedBehDesc == null
                          ? "There is no \"more information\" about this ride"
                          : widget.ride!.allowedBehDesc.toString(),
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileTap(
                              showFollowBottomInProfile: false,
                              userId: widget.ride!.car!.ownerId,
                              isDriver: true,
                            ),
                          ));
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFFFCD00),
                        child: Container(
                          height: 120,
                          width: 120,
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
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
                        widget.ride!.car?.owner?.firstName ?? "NA",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: mainText),
                      ),
                      Text(
                        "Verified driver",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => MapTrip(
                          origin: widget.ride!.placeofStart.toString(),
                          destination: widget.ride!.destination.toString(),
                          routeIndex: widget.ride!.routeIndex ?? 0,
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

  passengers(BuildContext context, String id, String seatPosition, Ride? ride) {
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
                if (response.data != null) {
                  //
                }
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              children: [
                                Text(
                                  '${response.data != null && response.data!.users.isNotEmpty ? response.data!.users.first.userName : 'No username'}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ));
                      }),
                    ],
                  ),
                );
              }),
          Text(
            seatPosition,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.green),
          ),
        ],
      ),
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
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: ColorsRes.gradientOneColor, width: 0.5),
              ),
              child: CachedNetworkImage(
                imageUrl: getCarImageUrl(images.first),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              )),
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
