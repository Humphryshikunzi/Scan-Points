import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pamride/controllers/rides_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/models/schemas.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/terms_conditions.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../controllers/account_controller.dart';

class PostRideForm extends StatefulWidget {
  final String origin;
  final String destination;
  final String duration;
  final String distance;
  final int routeIndex;
  final Map<String, String> myCars;

  const PostRideForm(
      {Key? key,
      required this.origin,
      required this.destination,
      required this.duration,
      required this.distance,
      required this.routeIndex,
      required this.myCars})
      : super(key: key);

  @override
  State<PostRideForm> createState() => _PostRideFormState();
}

class _PostRideFormState extends State<PostRideForm> {
  String date = "";
  String time = "";
  late String _hour, _minute, _time;
  String? dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  /// text editing controllers
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _tempDateController = TextEditingController();
  TextEditingController _tempTimeController = TextEditingController();
  TextEditingController exactLocationTextEditingController =
      TextEditingController();
  TextEditingController exactStopLocationTextEditingController =
      TextEditingController();

  /// text form controller for the ride definition
  final TextEditingController textEditingController = TextEditingController();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  /// variable to store the allowed behaviour description given by the driver
  String allowedBehaviourDescriprion = "";

  String? _frontLeft;
  String? _middleLeft;
  String? _backLeft;
  String? _MiddleCentre;
  String? _BackCentre;
  String? _middleRight;
  String? _backRight;
  String plateNumber = "";
  double distance = 0;
  double? estimatedPrice;
  int numberOfSeats = 1;
  String _selected_car = '5 Seater';
  String? selectedCarId;
  bool acceptTerms = false;
  bool isRecurring = false;
  var car_types = ['5 Seater', '7 Seater'];
  Link? link;
  Timer? _debounce;

  /// function to select the trip's date
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        String day = picked.day.toString();
        String month = picked.month.toString();
        String year = picked.year.toString();

        /// add a zero at the front of both day and month if they are one digit
        if (day.length == 1) {
          day = "0" + day;
        }
        if (month.length == 1) {
          month = "0" + month;
        }

        /// format the date using day,mont and year
        date = day + "-" + month + "-" + year;
        _dateController.text = selectedDate.toString();
        _tempDateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  /// function to select the trip's time
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();

        /// add a zero at the front of both hour and minute if they are one digit
        if (_hour.length == 1) {
          _hour = "0" + _hour;
        }
        if (_minute.length == 1) {
          _minute = "0" + _minute;
        }

        /// determine if the time choosen is either AM or PM
        if (int.parse(_hour) < 12) {
          time = _hour + ':' + _minute + ' AM';
        } else {
          time = _hour + ':' + _minute + ' PM';
        }

        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                selectedTime.hour,
                selectedTime.minute)
            .toString();
        _tempTimeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    getLink();
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();

    super.initState();
    analytics.setCurrentScreen(screenName: "Post Ride Form");
  }

  void initializeHive() async {
    await initHiveForFlutter();
  }

  void getLink() async {
    link = await getLinkAndToken();
    setState(() {
      link = link;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (link == null) {
      return CircularProgressIndicator();
    }
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link!,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    dateTime = DateFormat.yMd().format(DateTime.now());

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsRes.backgroundColor,
        title: Row(
          children: [
            BackButton(color: Colors.black),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'BACK',
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 90,
                                padding: const EdgeInsets.only(top: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text("Select Date",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.7))),
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                      enabled: false,
                                      keyboardType: TextInputType.text,
                                      controller: _tempDateController,
                                      onSaved: (String? val) {},
                                      decoration: InputDecoration(
                                          disabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'DATE',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                          contentPadding:
                                              EdgeInsets.only(top: 0.0)),
                                    ),
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 2),
                                      child: Text("Select Time",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.7))),
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                      onSaved: (String? val) {},
                                      enabled: false,
                                      keyboardType: TextInputType.text,
                                      controller: _tempTimeController,
                                      decoration: InputDecoration(
                                          disabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'TIME',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.all(2)),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // select car
                  FormBuilderDropdown(
                    name: 'car',
                    decoration: InputDecoration(
                      labelText: 'Select Car',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: widget.myCars.keys
                        .map(
                          (value) => DropdownMenuItem<String>(
                            onTap: () {
                              plateNumber = value;
                              selectedCarId = widget.myCars[value];
                            },
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),

                  /// trip distance
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Distance(KM)',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    initialValue: widget.distance,
                    keyboardType: TextInputType.number,
                  ),

                  /// trip price
                  TextFormField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Price(KES)',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    onChanged: (value) {
                      estimatedPrice = double.parse(value.toString());
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(20),
                    ]),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'Exact pickup location',
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: TextFormField(
                      controller: exactLocationTextEditingController,
                      minLines: 3,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                          hintText:
                              "Enter the exact pick up location e.g., Kaware restaurant",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'Exact stop location',
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: TextFormField(
                      controller: exactStopLocationTextEditingController,
                      minLines: 3,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                          hintText:
                              "Enter the exact stop location e.g., Tom Mboya street",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'Additional information',
                      ),
                    ],
                  ),

                  /// allowed behaviour description
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: TextFormField(
                      controller: textEditingController,
                      minLines: 3,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Type a brief description about the ride",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select your car capacity',
                  ),
                  DropdownButton(
                    hint: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(_selected_car),
                    ),
                    items: car_types.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    value: _selected_car,
                    onChanged: (value) {
                      setState(() {
                        _selected_car = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select the available car seats below',
                  ),
                  Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
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
                                        if (_backLeft == 'NA') {
                                          Get.snackbar('Information',
                                              'The seat is not available for booking',
                                              colorText: Colors.white,
                                              backgroundColor: Colors.brown,
                                              snackPosition: SnackPosition.TOP);
                                        } else {
                                          setState(() {
                                            if (_backLeft != null) {
                                              _backLeft = null;
                                            } else {
                                              _backLeft = '';
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: _backLeft == null
                                              ? Colors.grey.withOpacity(0.5)
                                              : Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons
                                                      .airline_seat_recline_extra_outlined,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Back Left',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
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
                                        if (_BackCentre == 'NA') {
                                          Get.snackbar('Information',
                                              'The seat is not available for booking',
                                              colorText: Colors.white,
                                              backgroundColor: Colors.brown,
                                              snackPosition: SnackPosition.TOP);
                                        } else {
                                          setState(() {
                                            if (_BackCentre != null) {
                                              _BackCentre = null;
                                            } else {
                                              _BackCentre = '';
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: _BackCentre == null
                                              ? Colors.grey.withOpacity(0.5)
                                              : Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons
                                                      .airline_seat_recline_extra_outlined,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Back Center',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
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
                                        if (_backRight == 'NA') {
                                          Get.snackbar('Information',
                                              'The seat is not available for booking',
                                              colorText: Colors.white,
                                              backgroundColor: Colors.brown,
                                              snackPosition: SnackPosition.TOP);
                                        } else {
                                          setState(() {
                                            if (_backRight != null) {
                                              _backRight = null;
                                            } else {
                                              _backRight = '';
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: _backRight == null
                                              ? Colors.grey.withOpacity(0.5)
                                              : Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons
                                                      .airline_seat_recline_extra_outlined,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Back Right',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: _selected_car == '7 Seater',
                                  child: Column(
                                    /// middle left seat
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (_middleLeft == 'NA') {
                                            Get.snackbar('Information',
                                                'The seat is not available for booking',
                                                colorText: Colors.white,
                                                backgroundColor: Colors.brown,
                                                snackPosition:
                                                    SnackPosition.TOP);
                                          } else {
                                            setState(() {
                                              if (_middleLeft != null) {
                                                _middleLeft = null;
                                              } else {
                                                _middleLeft = '';
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 56,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: _middleLeft == null
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.green,
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons
                                                        .airline_seat_recline_extra_outlined,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Middle Left',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
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
                                          if (_MiddleCentre == 'NA') {
                                            Get.snackbar('Information',
                                                'The seat is not available for booking',
                                                colorText: Colors.white,
                                                backgroundColor: Colors.brown,
                                                snackPosition:
                                                    SnackPosition.TOP);
                                          } else {
                                            setState(() {
                                              if (_MiddleCentre != null) {
                                                _MiddleCentre = null;
                                              } else {
                                                _MiddleCentre = '';
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 56,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: _MiddleCentre == null
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.green,
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons
                                                        .airline_seat_recline_extra_outlined,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Middle Center',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
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
                                          if (_middleRight == 'NA') {
                                            Get.snackbar('Information',
                                                'The seat is not available for booking',
                                                colorText: Colors.white,
                                                backgroundColor: Colors.brown,
                                                snackPosition:
                                                    SnackPosition.TOP);
                                          } else {
                                            setState(() {
                                              if (_middleRight != null) {
                                                _middleRight = null;
                                              } else {
                                                _middleRight = '';
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 56,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: _middleRight == null
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.green,
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons
                                                        .airline_seat_recline_extra_outlined,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Middle Right',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// front left seat
                                    GestureDetector(
                                      onTap: () {
                                        if (_frontLeft == 'NA') {
                                          Get.snackbar('Information',
                                              'The seat is not available for booking',
                                              colorText: Colors.white,
                                              backgroundColor: Colors.brown,
                                              snackPosition: SnackPosition.TOP);
                                        } else {
                                          setState(() {
                                            if (_frontLeft != null) {
                                              _frontLeft = null;
                                            } else {
                                              _frontLeft = '';
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 69,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: _frontLeft == null
                                              ? Colors.grey.withOpacity(0.5)
                                              : Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons
                                                      .airline_seat_recline_extra_outlined,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Front',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),

                                    /// driver seat
                                    Container(
                                      height: 69,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.02),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: 35,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Driver',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
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
                  //select seats
                  SizedBox(
                    height: 2,
                  ),

                  // if recuring
                  FormBuilderCheckbox(
                    name: 'isRecurring',
                    initialValue: false,
                    onChanged: (value) {
                      setState(() {
                        isRecurring = value!;
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
                                            Text('What is a recurring ride?'),
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
                            style: TextStyle(color: ColorsRes.gradientTwoColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),

                  // terms and conditions
                  FormBuilderCheckbox(
                    name: 'accept_terms',
                    initialValue: false,
                    onChanged: (value) {
                      setState(() {
                        acceptTerms = value!;
                      });
                    },
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I have read and agreed to the ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            recognizer: new TapGestureRecognizer()
                              ..onTap =
                                  () => Get.to(() => TermsAndConditions()),
                            text: 'Terms and Conditions',
                            style: TextStyle(color: ColorsRes.gradientTwoColor),
                          ),
                        ],
                      ),
                    ),
                    validator: FormBuilderValidators.equal(
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                ],
              ),
              GraphQLProvider(
                client: client,
                child: Mutation(
                    options: MutationOptions(
                      document: gql(
                          createARideMutation), // this is the mutation string you just created
                      // or do something with the result.data on completion
                      onCompleted: (dynamic resultData) {
                        SVProgressHUD.dismiss();
                        if (resultData == null) {
                          QuickAlert.show(
                            context: context,
                            title: "Oops",
                            text:
                                "An error occurred while processing your request.\nPlease try again later",
                            confirmBtnColor: Colors.blue,
                            confirmBtnText: "Okay",
                            onConfirmBtnTap: () {
                              Navigator.pop(context);
                            },
                            type: QuickAlertType.error,
                          );
                        } else {
                          QuickAlert.show(
                            context: context,
                            title: "Success!",
                            text: "Ride created successfully!",
                            confirmBtnColor: Colors.green,
                            confirmBtnText: "Go to Homepage",
                            onConfirmBtnTap: () {
                              RidesController controller =
                                  Get.find<RidesController>();
                              AccountController accController =
                                  Get.find<AccountController>();
                              controller.update();
                              accController.update();

                              Get.offAll(() => HomePage());
                            },
                            type: QuickAlertType.success,
                          );
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
                      return MaterialButton(
                        color: acceptTerms ? ColorsRes.green : Colors.grey,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            // do my staff

                            if (selectedCarId == null) {
                              Get.snackbar(
                                  'Error', 'Select a car and try again');
                            } else if (estimatedPrice == null ||
                                estimatedPrice! < 30) {
                              Get.snackbar('Error',
                                  'Estimated price should be atleast Ksh 30');
                            } else if (!acceptTerms) {
                              Get.snackbar(
                                  'Error', 'Accept the terms and conditions');
                            } else if (_tempDateController.text.isEmpty) {
                              Get.snackbar('Error', 'Enter a date');
                            } else if (_tempTimeController.text.isEmpty) {
                              Get.snackbar('Error', 'Enter a time');
                            } else if (exactLocationTextEditingController
                                .text.isEmpty) {
                              Get.snackbar('Error', 'Enter an exact location');
                            } else if ((_frontLeft == null &&
                                    _backLeft == null &&
                                    _BackCentre == null &&
                                    _backRight == null) &&
                                _selected_car == "5 Seater") {
                              // At least one value is empty and not all of them are "NA" or null
                              Get.snackbar('Error', 'Choose atleast one seat');
                            } else if ((_frontLeft == null &&
                                    _middleLeft == null &&
                                    _backLeft == null &&
                                    _MiddleCentre == null &&
                                    _BackCentre == null &&
                                    _middleRight == null &&
                                    _backRight == null) &&
                                _selected_car == "7 Seater") {
                              // At least one value is empty and not all of them are "NA" or null
                              Get.snackbar('Error', 'Choose atleast one seat');
                            } else {
                              DateTime depTime = DateTime(
                                  DateTime.parse(_dateController.text).year,
                                  DateTime.parse(_dateController.text).month,
                                  DateTime.parse(_dateController.text).day,
                                  DateTime.parse(_timeController.text).hour,
                                  DateTime.parse(_timeController.text).minute);
                              allowedBehaviourDescriprion =
                                  textEditingController.value.text;
                              SVProgressHUD.show(status: "Creating ride...");

                              /// the mutation has "allowed behaviour description" parameter for driver to provide more info about the ride
                              runMutation({
                                'allowedBehDesc': allowedBehaviourDescriprion,
                                'maxCarry': numberOfSeats,
                                'estimateTime': widget.duration,
                                'numberOfPeople': numberOfSeats,
                                'departureDate': depTime.toString(),
                                'estimateDistance': widget.distance,
                                'destination': widget.destination,
                                'carId': selectedCarId,
                                'frontLeft': _frontLeft == null ? "NA" : "",
                                'middleLeft': _middleLeft == null ? "NA" : "",
                                'middleCentre':
                                    _MiddleCentre == null ? "NA" : "",
                                'middleRight': _middleRight == null ? "NA" : "",
                                'backLeft': _backLeft == null ? "NA" : "",
                                'backCentre': _BackCentre == null ? "NA" : "",
                                'backRight': _backRight == null ? "NA" : "",
                                'estimatePrice': estimatedPrice,
                                'placeOfStart': widget.origin,
                                'name':
                                    widget.origin + " to " + widget.destination,
                                'departureTime': "${time}",
                                'exactPickupLocation':
                                    exactLocationTextEditingController.text,
                                'exactDropOffLocation':
                                    exactStopLocationTextEditingController.text,
                                'rideIndex': widget.routeIndex,
                                'isRecurring': isRecurring,
                              });
                            }
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CarSeat(bool position, bool isFront) {
    return GestureDetector(
      onTap: () {
        setState(() {
          position = !position;
        });
      },
      child: Container(
        width: isFront
            ? MediaQuery.of(context).size.width * 0.3
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: position ? Colors.green : Colors.grey.withOpacity(0.5),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.airline_seat_recline_extra_outlined,
              color: Colors.white),
        ),
      ),
    );
  }
}
