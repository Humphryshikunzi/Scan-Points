import 'dart:async';
import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Response;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/widgets/Alert.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../widgets/DialogButton.dart';
import '../../widgets/constants.dart';
import 'booking_success.dart';

class CheckoutPage extends StatefulWidget {
  final GGetRidesData_rides ride;
  const CheckoutPage({required this.ride});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  TextEditingController exactStopLocationTextEditingController =
      TextEditingController();

  bool validate = false;
  int? value;
  int paymentValue = 0;
  bool loading = false;
  bool isMpesa = true;
  String? amount, callbackUrl, phoneNumber;
  String? _frontLeft;
  String? _middleLeft;
  String? _backLeft;
  String? _MiddleCentre;
  String? _BackCentre;
  String? _middleRight;
  String? _backRight;
  String? frontLeft;
  String? middleLeft;
  String? backLeft;
  String? MiddleCentre;
  String? BackCentre;
  String? middleRight;
  String? backRight;

  late double totalBookingPrice;

  List<String> selectedSeats = [];
  List<String> paymentIconList = [
    'assets/images/mpesa.png',
  ];
  List<String> paymentMethodList = [
    'MPesa (Default)',
    // 'Bank Transfer',
    // 'Paypal',
    // 'Credit Card',
    // 'Airtel Money',
  ];

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ',
  );

  @override
  void initState() {
    amount =
        double.parse(_accountController.cartAmount.value).round().toString();
    callbackUrl = _clientController.callBackUrl;
    phoneNumber = Constant.formatKenyanPhoneNumber(
        _accountController.phoneNumber.value ?? '');
    ;
    totalBookingPrice = 0;
    if (_accountController.phoneNumber.value!.length > 8) {
      validate = true;
    } else {
      validate = false;
    }
    initializeSeats();
    super.initState();
    analytics.setCurrentScreen(screenName: 'Checkout Page');
  }

  void initializeSeats() {
    _frontLeft = widget.ride.seat?.frontLeft != null &&
            widget.ride.seat!.frontLeft!.length > 5
        ? 'BKD'
        : widget.ride.seat?.frontLeft;
    _middleLeft = widget.ride.seat?.middleLeft != null &&
            widget.ride.seat!.middleLeft!.length > 5
        ? 'BKD'
        : widget.ride.seat?.middleLeft;
    _backLeft = widget.ride.seat?.backLeft != null &&
            widget.ride.seat!.backLeft!.length > 5
        ? 'BKD'
        : widget.ride.seat?.backLeft;
    _MiddleCentre = widget.ride.seat?.middleCentre != null &&
            widget.ride.seat!.middleCentre!.length > 5
        ? 'BKD'
        : widget.ride.seat?.middleCentre;
    _BackCentre = widget.ride.seat?.backCentre != null &&
            widget.ride.seat!.backCentre!.length > 5
        ? 'BKD'
        : widget.ride.seat?.backCentre;
    _middleRight = widget.ride.seat?.middleRight != null &&
            widget.ride.seat!.middleRight!.length > 5
        ? 'BKD'
        : widget.ride.seat?.middleRight;
    _backRight = widget.ride.seat?.backRight != null &&
            widget.ride.seat!.backRight!.length > 5
        ? 'BKD'
        : widget.ride.seat?.backRight;
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
            _accountController.verifyingPayment.value = false;
            loading = false;
            validate = false;
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
                      'Booking',
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _accountController.verifyingPayment.value
                          ? _bookingStatusModule()
                          : _paymentModule()
                    ],
                  );
                }),
              ),
            ),
          ),
          loading
              ? SizedBox.shrink()
              : Visibility(
                  visible: !loading &&
                      !(_frontLeft == widget.ride.seat?.frontLeft &&
                          _middleLeft == widget.ride.seat?.middleLeft &&
                          _backLeft == widget.ride.seat?.backLeft &&
                          _MiddleCentre == widget.ride.seat?.middleCentre &&
                          _BackCentre == widget.ride.seat?.backCentre &&
                          _middleRight == widget.ride.seat?.middleRight &&
                          _backRight == widget.ride.seat?.backRight),
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 100, right: 100, bottom: 20),
                      height: 48,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Center(
                              child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    // passenger cancel booking
                                    AlertDialog alertDialog = AlertDialog(
                                      title: Text("Cancel Booking"),
                                      content: Text(
                                          "Are you sure you want to cancel this booking info? The page will be refreshed."),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "No, stay",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CheckoutPage(
                                                                ride:
                                                                    widget.ride,
                                                              )));
                                            },
                                            child: Text(
                                              "Yes, cancel",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                      ],
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertDialog;
                                        });
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: primary,
                                    backgroundColor: primary,
                                  )),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  if (phoneNumber != null &&
                                      phoneNumber!.length < 10) {
                                    Get.showSnackbar(GetSnackBar(
                                      icon: Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.red,
                                      ),
                                      duration: Duration(seconds: 5),
                                      snackPosition: SnackPosition.TOP,
                                      title: 'Error',
                                      message: 'Enter a valid phone number',
                                    ));
                                  } else {
                                    setState(() {
                                      loading = true;
                                      _accountController
                                          .verifyingPayment.value = true;
                                      _makeBooking();
                                    });
                                  }
                                },
                                child: Text("Book"),
                                style: ElevatedButton.styleFrom(
                                    primary: primary,
                                    backgroundColor: Colors.green),
                              ),
                            ],
                          )),
                        ],
                      )),
                ),
        ],
      ),
    );
  }

  ///Displays payment methods, phone number and `Complete Booking` button.
  _paymentModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Tap to select your preferred seat(s) below',
            )),
        Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                Positioned.fill(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset('assets/images/car_top.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          /// back left seat
                          GestureDetector(
                            onTap: () {
                              if (_backLeft == 'NA' || _backLeft == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_backLeft == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _backLeft = null;
                                    selectedSeats.add('BackLeft');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }
                                    _backLeft = '';
                                    selectedSeats.remove('BackLeft');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _backLeft != null &&
                                        _backLeft != "NA" &&
                                        _backLeft != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _backLeft == "NA" || _backLeft == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Back Left',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          /// back center seat
                          GestureDetector(
                            onTap: () {
                              if (_BackCentre == 'NA' || _BackCentre == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_BackCentre == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _BackCentre = null;
                                    selectedSeats.add('BackCentre');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }
                                    _BackCentre = '';
                                    selectedSeats.remove('BackCentre');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _BackCentre != null &&
                                        _BackCentre != 'NA' &&
                                        _BackCentre != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _BackCentre == "NA" ||
                                            _BackCentre == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Back Centre',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          /// back right seat
                          GestureDetector(
                            onTap: () {
                              if (_backRight == 'NA' || _backRight == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_backRight == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _backRight = null;
                                    selectedSeats.add('BackRight');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }

                                    _backRight = '';
                                    selectedSeats.remove('BackRight');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _backRight != null &&
                                        _backRight != 'NA' &&
                                        _backRight != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _backRight == 'NA' || _backRight == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Back Right',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        /// middle left seat
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_middleLeft == 'NA' || _middleLeft == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_middleLeft == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _middleLeft = null;
                                    selectedSeats.add('MiddleLeft');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }
                                    double.parse(
                                        _accountController.cartAmount.value);
                                    _middleLeft = '';
                                    selectedSeats.remove('MiddleLeft');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _middleLeft != null &&
                                        _middleLeft != 'NA' &&
                                        _middleLeft != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _middleLeft == "NA" ||
                                            _middleLeft == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Middle Left',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          /// middle center seat
                          GestureDetector(
                            onTap: () {
                              if (_MiddleCentre == 'NA' ||
                                  _MiddleCentre == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_MiddleCentre == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _MiddleCentre = null;
                                    selectedSeats.add('MiddleCentre');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }
                                    _MiddleCentre = '';
                                    selectedSeats.remove('MiddleCentre');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _MiddleCentre != null &&
                                        _MiddleCentre != "NA" &&
                                        _MiddleCentre != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _MiddleCentre == "NA" ||
                                            _MiddleCentre == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Middle Centre',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          /// middle right seat
                          GestureDetector(
                            onTap: () {
                              if (_middleRight == 'NA' ||
                                  _middleRight == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_middleRight == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _middleRight = null;
                                    selectedSeats.add('MiddleRight');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }

                                    _middleRight = '';
                                    selectedSeats.remove('MiddleRight');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 54,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _middleRight != null &&
                                        _middleRight != "NA" &&
                                        _middleRight != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _middleRight == "NA" ||
                                            _middleRight == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Middle Right',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// front left seat
                          GestureDetector(
                            onTap: () {
                              if (_frontLeft == 'NA' || _frontLeft == 'BKD') {
                                Get.snackbar('Information',
                                    'The seat is not available for booking',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.brown,
                                    snackPosition: SnackPosition.TOP);
                              } else {
                                setState(() {
                                  if (_frontLeft == '') {
                                    totalBookingPrice = totalBookingPrice +
                                        double.parse(_accountController
                                            .cartAmount.value);
                                    _frontLeft = null;
                                    selectedSeats.add('FrontLeft');
                                  } else {
                                    if (totalBookingPrice >=
                                        double.parse(_accountController
                                            .cartAmount.value)) {
                                      totalBookingPrice = totalBookingPrice -
                                          double.parse(_accountController
                                              .cartAmount.value);
                                    }
                                    _frontLeft = '';
                                    selectedSeats.remove('FrontLeft');
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 70,
                              width: 80,
                              decoration: BoxDecoration(
                                color: _frontLeft != null &&
                                        _frontLeft != "NA" &&
                                        _frontLeft != 'BKD'
                                    ? Colors.orange.withOpacity(0.5)
                                    : _frontLeft == "NA" || _frontLeft == 'BKD'
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        Icons
                                            .airline_seat_recline_extra_outlined,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Front',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          /// driver seat
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.02),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: SvgPicture.asset(
                                      "assets/images/steering-wheel.svg",
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 35,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Driver',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
        Row(
          children: [
            Text("Exact Drop off Location"),
          ],
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.95,
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: TextFormField(
            controller: exactStopLocationTextEditingController,
            minLines: 2,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              fontSize: 16,
            ),
            decoration: const InputDecoration(
                hintText:
                    "Enter the exact drop off location e.g. Tom Mboya street",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
        ),
        Divider(),
        Row(
          children: [
            Text("Total Booking Price:"),
            Spacer(),
            Text('KES ' + totalBookingPrice.toString())
          ],
        ),
        SizedBox(
          height: 20,
        ),
        isMpesa
            ? Card(
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/mpesa.png',
                    width: 30,
                    height: 30,
                  ),
                  title: Text(phoneNumber.toString()),
                  subtitle: Text('Your Mpesa Number'),
                  trailing: GestureDetector(
                    onTap: () {
                      //_changeNumber(context);
                    },
                    child: Icon(
                      Icons.money_rounded,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            children: [
              TextSpan(text: 'Other payment methods are '), 
              TextSpan(
                  text: 'Paypal',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ', '),
              TextSpan(
                  text: 'Credit Card',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' and '),
              TextSpan(
                  text: 'Crypto.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ' You can choose either of them when paying after the ride has been approved.'),
            ],
          ),
        )
      ],
    );
  }

  ///This module shows up when the user has a pending booing process.
  _bookingStatusModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Currently booking this ride, Please Wait.')),
        Divider(),
        Card(
          elevation: 15,
          child: Column(
            children: [
              isMpesa
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Payment Method: MPESA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
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
                      'Do Not Exit This Page To Complete Booking',
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

  ///Change user phone number format.
  _changeNumber(context) {
    TextEditingController _phoneEditingController = TextEditingController();
    Alert(
      context: context,
      type: AlertType.info,
      title: "Change MPesa Number",
      content: TextField(
        keyboardType: TextInputType.phone,
        controller: _phoneEditingController,
        style: TextStyle(
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
            hintText: 'Use the format: 2547********',
            errorText:
                validate ? 'Enter the correct phone number format' : null),
        cursorColor: ColorsRes.gradientOneColor,
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            if (_phoneEditingController.text.length > 8) {
              setState(() {
                validate = true;
              });
            } else {
              validate = false;
            }
            setState(() {
              phoneNumber = _phoneEditingController.text;
            });
            _accountController.phoneNumber = _phoneEditingController.text.obs;
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          gradient: LinearGradient(
              colors: [ColorsRes.gradientOneColor, ColorsRes.gradientTwoColor]),
        ),
      ],
    ).show();
  }

  Widget paymentItem(int i) {
    return Card(
      elevation: 0.1,
      child: RadioListTile(
          tileColor: Colors.green,
          value: i,
          dense: true,
          selected: isMpesa,
          autofocus: isMpesa,
          toggleable: isMpesa,
          groupValue: paymentValue,
          onChanged: (dynamic ind) {
            setState(() {
              paymentValue = ind;
              paymentMethodList[i] == "MPesa"
                  ? setState(() {
                      isMpesa = true;
                    })
                  : setState(() {
                      isMpesa = false;
                    });
            });
          },
          title: Row(
            children: [
              Expanded(
                child: Text(
                  paymentMethodList[i],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              paymentIconList[i].contains('svg')
                  ? SvgPicture.asset(paymentIconList[i])
                  : Image.asset(
                      paymentIconList[i],
                      width: 30,
                      height: 30,
                    ),
            ],
          )),
    );
  }

  Future<bool> _makeBooking() async {
    String body = jsonEncode({
      "amount": totalBookingPrice,
      "PhoneNumber": phoneNumber,
      "rideId": widget.ride.id,
      "passengerId": _accountController.accountId.value,
      "driverId": widget.ride.car!.ownerId,
      "ExactDropOffLocation": exactStopLocationTextEditingController.text,
      "availableSeats": selectedSeats,
    });

    var authToken = await getAuthToken();
    var response = await post(Uri.parse(Constant.bookingRequestUrl),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $authToken"
        });

    if (response.statusCode == 200) {
      _accountController.verifyingPayment = false.obs;
      setState(
        () {
          _accountController.verifyingPayment.value = false;
          loading = false;
          validate = false;
        },
      );
      Get.off(BookingSuccess(
        isPayment: false,
      ));
      analytics.logEvent(name: 'booking_success', parameters: null);

      return true;
    } else {
      Get.snackbar('Failed', 'Ride booking failed, please try again');
      setState(() {
        _accountController.verifyingPayment.value = false;
        loading = false;
      });

      analytics.logEvent(name: 'booking_failed', parameters: null);

      return false;
    }
  }
}
