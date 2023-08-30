import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Response;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/booking_success.dart';
import 'package:pamride/pages/mobile/ride_details_profile.dart';
import 'package:pamride/pages/mobile/support.dart';
import 'package:pamride/widgets/Alert.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../widgets/DialogButton.dart';
import '../../widgets/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gfl;

class PaymentPage extends StatefulWidget {
  final Ride? ride;
  final String transactionId;
  final String transactionPhoneNumber;
  final String? rideId;
  final String? seatPostion;
  const PaymentPage({
    required this.transactionId,
    required this.transactionPhoneNumber,
    this.ride,
    this.rideId,
    this.seatPostion,
  });
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  bool validate = false;
  int? value;
  int paymentValue = 0;
  bool loading = false;
  bool isMpesa = true;
  bool? seatAvailable;
  String? phoneNumber;
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
  String? callBackUrl;
  String? driverId;
  String transactionId = "";

  List<String> selectedSeats = [];
  List<String> paymentIconList = [
    'assets/images/mpesa.png',
  ];
  List<String> paymentMethodList = [
    'MPesa',
  ];

  Ride? loadedRide;
  late Future<Ride?> rideInfo;
  Link? link;

  String checkoutMutation =
      """mutation Transaction(\$phoneNumber: String!, \$amount: String!, \$callBackUrl: String!){
    transact(
        request: {
            phoneNumber: \$phoneNumber
            amount: \$amount
            callBackUrl: 
           \$callBackUrl
        }
    ) {
        responseCode
		checkoutRequestID
		merchantRequestID
		responseDescription
    }
}""";

  @override
  void initState() {
    if (widget.ride == null) {
      rideInfo = fetchRideData();
    } else {
      loadedRide = widget.ride;
    }
    fetchRideData();
    getLink();
    super.initState();
    analytics.setCurrentScreen(screenName: 'Payment Page');
  }

  void initializeSeats() {
    _frontLeft = loadedRide!.seat.frontLeft.length > 5
        ? 'BKD'
        : loadedRide!.seat.frontLeft;
    _middleLeft = loadedRide!.seat.middleLeft.length > 5
        ? 'BKD'
        : loadedRide!.seat.middleLeft;
    _backLeft = loadedRide!.seat.backLeft.length > 5
        ? 'BKD'
        : loadedRide!.seat.backLeft;
    _MiddleCentre = loadedRide!.seat.middleCentre.length > 5
        ? 'BKD'
        : loadedRide!.seat.middleCentre;
    _BackCentre = loadedRide!.seat.backCentre.length > 5
        ? 'BKD'
        : loadedRide!.seat.backCentre;
    _middleRight = loadedRide!.seat.middleRight.length > 5
        ? 'BKD'
        : loadedRide!.seat.middleRight;
    _backRight = loadedRide!.seat.backRight.length > 5
        ? 'BKD'
        : loadedRide!.seat.backRight;
  }

  getPrefs() async {
    _accountController.cartAmount.value =
        loadedRide!.estimatePrice.toString().split('.')[0];
    phoneNumber =
        Constant.formatKenyanPhoneNumber(widget.transactionPhoneNumber);
    transactionId = widget.transactionId;
    callBackUrl = "${_clientController.callBackUrl}/$transactionId";

    if (_accountController.phoneNumber.value!.length > 8) {
      validate = true;
    } else {
      validate = false;
    }
  }

  getLink() async {
    link = await getLinkAndToken();
    setState(() {
      link = link;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (link == null) {
      return Scaffold(
        extendBody: true,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link!,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    if (loadedRide == null) {
      return Scaffold(
        extendBody: true,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // only perform this after the ride has been loaded

    initializeSeats();
    getPrefs();

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
                      'Checkout',
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
                          ? _verificationModule()
                          : _paymentModule()
                    ],
                  );
                }),
              ),
            ),
          ),
          loading || seatAvailable == false
              ? Text(
                  "This seat is no longer available, \nkindly select another seat",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: !loading,
                      child: GraphQLProvider(
                        client: client,
                        child: Mutation(
                            options: MutationOptions(
                              document: gql(
                                  checkoutMutation), // this is the mutation string you just created

                              // or do something with the result.data on completion
                              onCompleted: (dynamic resultData) {
                                if (resultData == null ||
                                    resultData['transact']
                                            ['checkoutRequestID'] ==
                                        null) {
                                  setState(() {
                                    loading = false;
                                    _accountController.verifyingPayment.value =
                                        false;
                                  });
                                  QuickAlert.show(
                                    context: context,
                                    title: "Oops",
                                    text:
                                        "An error occurred.\nPlease try again later",
                                    confirmBtnColor: Colors.orange,
                                    confirmBtnText: "Try again",
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    },
                                    type: QuickAlertType.error,
                                  );
                                } else {
                                  String checkoutRequestID =
                                      resultData['transact']
                                          ['checkoutRequestID'];
                                  if (checkoutRequestID.length > 5) {
                                    _accountController.checkourRequestId.value =
                                        checkoutRequestID;
                                    _accountController.verifyingPayment.value =
                                        true;
                                    _confirmPayment(checkoutRequestID);
                                  }
                                }
                              },
                              update: (cache, result) {
                                debugPrint(result.toString());
                                return cache;
                              },
                            ),
                            builder: (
                              runMutation,
                              result,
                            ) {
                              return CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: new Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 36,
                                  decoration: new BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "MPesa Payment",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_frontLeft == null &&
                                      _middleLeft == null &&
                                      _backLeft == null &&
                                      _MiddleCentre == null &&
                                      _BackCentre == null &&
                                      _middleRight == null &&
                                      _backRight == null) {
                                  } else {
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
                                      });

                                      runMutation({
                                        'phoneNumber': phoneNumber.toString(),
                                        'amount':
                                            _accountController.cartAmount.value,
                                        'callBackUrl': callBackUrl!,
                                      });
                                    }
                                  }
                                },
                              );
                            }),
                      ),
                    ),
                    Visibility(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () => {
                                  Alert(
                                    context: context,
                                    type: AlertType.info,
                                    title: "Other Payment Methods",
                                    content: Text(
                                      "For other payment methods, you will be redirected to a page, in the message input,"
                                      " kindly indicate that you wish to pay for a ride and we will contact you with payment details.",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    buttons: [
                                      DialogButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop('dialog');
                                        },
                                        gradient: LinearGradient(colors: [
                                          ColorsRes.white,
                                          ColorsRes.white
                                        ]),
                                      ),
                                      DialogButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Get.to(() => SupportPage());
                                        },
                                        gradient: LinearGradient(colors: [
                                          Colors.green,
                                          Colors.green
                                        ]),
                                      ),
                                    ],
                                  ).show()
                                },
                            child: Text('Other Payment')))
                  ],
                )
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
            child: Column(
              children: [
                Text(
                    'Ride Id: ${loadedRide!.id}, Seat: ${widget.seatPostion!}'),
                SizedBox(height: 5),
                Text('Finish payment to complete booking trip')
              ],
            )),
        Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'BackLeft' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _backLeft != null &&
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                          SizedBox(
                            height: 5.0,
                          ),

                          /// back center seat
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'BackCentre' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _BackCentre != null &&
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                          SizedBox(
                            height: 5.0,
                          ),

                          /// back right seat
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'BackRight' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _backRight != null &&
                                          _backRight != 'NA' &&
                                          _backRight != 'BKD'
                                      ? Colors.orange.withOpacity(0.5)
                                      : _backRight == 'NA' ||
                                              _backRight == 'BKD'
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                        ],
                      ),
                      Column(
                        /// middle left seat
                        children: [
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'MiddleLeft' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _middleLeft != null &&
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                          SizedBox(
                            height: 5.0,
                          ),

                          /// middle center seat
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'MiddleCentre' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _MiddleCentre != null &&
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 54,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'MiddleRight' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _middleRight != null &&
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
                                      Icons.airline_seat_recline_extra_outlined,
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
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// front left seat
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              color: widget.seatPostion! == 'FrontLeft' &&
                                      seatAvailable == true
                                  ? Colors.green
                                  : _frontLeft != null &&
                                          _frontLeft != "NA" &&
                                          _frontLeft != 'BKD'
                                      ? Colors.orange.withOpacity(0.5)
                                      : _frontLeft == "NA" ||
                                              _frontLeft == 'BKD'
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
                                      Icons.airline_seat_recline_extra_outlined,
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
          children: [Text("Payment Option(s)"), Spacer(), Text("Select One")],
        ),
        Divider(),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: paymentMethodList.length,
            itemBuilder: (context, index) {
              return paymentItem(index);
            }),
        Divider(),
        Row(
          children: [
            Text("Total Booking Price:"),
            Spacer(),
            Text('KES ' + _accountController.cartAmount.value.toString())
          ],
        ),
        SizedBox(
          height: 5,
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
                      // _changeNumber(context);
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
              TextSpan(text: 'For these Payment Options: '),
              TextSpan(
                  text: 'Paypal',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ', '),
              TextSpan(
                  text: 'Credit Card',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' or '),
              TextSpan(
                  text: 'Crypto, ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: 'click '),
              TextSpan(
                text: "'Other Payment'",
                style: TextStyle(fontWeight: FontWeight.bold, color: primary),
              ),
            ],
          ),
        )
      ],
    );
  }

  ///This module shows up when the user has a pending payment process.
  _verificationModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Verifying Your Payment, Please Wait.')),
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
                      'Do Not Exit This Page To Complete Verification',
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

  Future _confirmPayment(String checkoutRequestID) async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String query = '''
        mutation {
      lNMPesaStatus(checkoutRequestID: "$checkoutRequestID") {
        responseCode
        responseDescription
        merchantRequestID
        checkoutRequestID
        resultCode
        resultDesc
      }
    }
      ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      Get.snackbar('Failed', 'Payment Error, please try again');
      setState(() {
        _accountController.verifyingPayment.value = false;
        loading = false;
      });
    } else {
      if (result.data!['lNMPesaStatus']['resultCode'] == '1032') {
        Get.snackbar(
            'Cancelled', 'User cancelled the payment, please try again');
        setState(() {
          _accountController.verifyingPayment.value = false;
          loading = false;
        });
      } else if (result.data!['lNMPesaStatus']['resultCode'] == '0') {
        setState(() {
          setState(
            () {
              _accountController.verifyingPayment.value = false;
              loading = false;
              validate = false;
            },
          );
          analytics.logEvent(name: "Payment_Successful", parameters: null);
          HttpHelper()
              .passengerFinishBooking(
                transactionId: transactionId,
              )
              .then((value) => {
                    value == true
                        ? Get.off(BookingSuccess(
                            isPayment: true,
                          ))
                        : Get.snackbar('Failed',
                            'Booking Error, please try again or contact support')
                  });
        });
      } else if (result.data!['lNMPesaStatus']['resultCode'] == '1037') {
        Get.snackbar('Cancelled', 'User can not be found, please try again');
        analytics.logEvent(
            name: "Payment_Failed",
            parameters: {"error": "User can not be found, please try again"});
        setState(() {
          _accountController.verifyingPayment.value = false;
          loading = false;
        });
      } else if (result.data!['lNMPesaStatus']['resultCode'] == '2001') {
        Get.snackbar('Wrong Password',
            'MPesa Password you entered is wrong, please try again');
        analytics.logEvent(name: "Payment_Failed", parameters: {
          "error": "MPesa Password you entered is wrong, please try again"
        });
        setState(() {
          _accountController.verifyingPayment.value = false;
          loading = false;
        });
      } else if (result.data!['lNMPesaStatus']['resultCode'] == null) {
        // Create a 3-second delay
        Timer(Duration(seconds: 3), () {
          _confirmPayment(checkoutRequestID);
        });
      }
    }
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

  Future<Ride?> fetchRideData() async {
    final gfl.GraphQLClient client = gfl.GraphQLClient(
      link: await getLinkAndToken(),
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
          device: null,
        ),
      ),
    );

    setState(() {
      loadedRide = rideData;
    });

    if (widget.seatPostion == "FrontLeft" && rideData.seat.frontLeft != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "BackLeft" &&
        rideData.seat.backLeft != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "BackCentre" &&
        rideData.seat.backCentre != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "BackRight" &&
        rideData.seat.backRight != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "MiddleLeft" &&
        rideData.seat.middleLeft != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "MiddleRight" &&
        rideData.seat.middleRight != "") {
      seatAvailable = false;
    } else if (widget.seatPostion == "MiddleCentre" &&
        rideData.seat.middleCentre != "") {
      seatAvailable = false;
    } else {
      seatAvailable = true;
    }

    return rideData;
  }
}
