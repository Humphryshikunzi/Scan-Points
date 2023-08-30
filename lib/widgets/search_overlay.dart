import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pamride/controllers/rides_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/models/station_info.dart';
import 'package:pamride/pages/mobile/search_result_page.dart';
import 'package:pamride/utilities/themeColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchOverlay extends StatefulWidget {
  final String? origin;
  const SearchOverlay({this.origin, Key? key}) : super(key: key);

  @override
  _SearchOverlayState createState() => _SearchOverlayState();
}

enum TripType { oneway, roundtrip, multicity }

class _SearchOverlayState extends State<SearchOverlay> {
  TripType _selectedTrip = TripType.oneway;
  TextEditingController _fromEditingController = TextEditingController();
  TextEditingController _toEditingController = TextEditingController();
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _timeEditingController = TextEditingController();
  TextEditingController _travellersEditingController = TextEditingController();
  TextEditingController _weightEditingController = TextEditingController();
  RidesController _ridesController = Get.find<RidesController>();

  /// this variable stores the initial value of the number of passengers (01)
  String initialValue = "01";

  /// this variable stores the dropdown items(the number of passengers)
  var dropdownItems = ["01", "02", "03", "04", "05", "06"];

  /// variable to store the selected number of passengers
  String selectedNumberOfPassengers = "";

  /// this variable stores the initial value of the number of small luggsge (01)
  String initialValue_SmallLuggage = "00";

  /// this variable stores the dropdown items(the number of passengers)
  var dropdownItems_SmallLuggage = ["00", "01", "02", "03", "04"];

  /// variable to store the selected number of passengers
  String selectedNumberOfSmallLuggage = "";

  /// this variable stores the initial value of the number of small luggsge (01)
  String initialValue_MediumLuggage = "00";

  /// this variable stores the dropdown items(the number of passengers)
  var dropdownItems_MediumLuggage = ["00", "01", "02", "03", "04"];

  /// variable to store the selected number of passengers
  String selectedNumberOfMediumLuggage = "";

  /// this variable stores the initial value of the number of small luggsge (01)
  String initialValue_LargeLuggage = "00";

  /// this variable stores the dropdown items(the number of passengers)
  var dropdownItems_LargeLuggage = ["00", "01", "02", "03", "04"];

  /// variable to store the selected number of passengers
  String selectedNumberOfLargeLuggage = "";

  bool? check1 = false, check2 = false, check3 = false;
  //true for checked checkbox, flase for unchecked one

  bool? check11 = false, check22 = false, check33 = false;

  /// variables to store the pickup location and destination values
  String pickUpLocation = "";
  String destination = "";
  String overlayTitleStr = "";

  /// the initial function of the screen
  @override
  void initState() {
    _timeEditingController.text = DateTime.now().toString();
    _dateEditingController.text = DateTime.now().toString();
    _fromEditingController.text = widget.origin ?? '';
    getOverlayTitle();
    super.initState();
  }

  @override
  void dispose() {
    clearOverlayTitle();
    super.dispose();
  }

  void getOverlayTitle() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      overlayTitleStr = (_prefs.getString('overlayTitle') != null
          ? _prefs.getString('overlayTitle')
          : "")!;
    });
  }

  void clearOverlayTitle() async {
    //Clear the value from SharedPreferences when leaving the page
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove('overlayTitle');
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey _key = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;
    _fromEditingController.text = overlayTitleStr;

    return SingleChildScrollView(
      child: SafeArea(
        child: FormBuilder(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: ColorsRes.backgroundColor,
                height: size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Search Filter',
                        style: GoogleFonts.overpass(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  backgroundColor: ColorsRes.backgroundColor,
                ),
                onPressed: () {},
                child: buildFromSelector(
                    locationInfo('From:', 'Nyeri', ''), Icons.location_on),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  backgroundColor: ColorsRes.backgroundColor,
                ),
                onPressed: () {},
                child: buildToSelector(
                    locationInfo('To:', 'Nairobi', ''), Icons.location_on),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: ColorsRes.backgroundColor,
                      ),
                      onPressed: () {},
                      child: buildDateSelector('DATE', DateTime.now()),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration:
                          BoxDecoration(color: ColorsRes.backgroundColor),
                      child: Row(
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildTravellersView(),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey[500],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: Text(
                                      'Select the size and number of luggage',
                                      style: GoogleFonts.overpass(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.13,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                          value: check11,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              check11 = value;
                                                            });
                                                          }),
                                                      Text("Small")
                                                    ],
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    child:
                                                        DropdownButtonFormField(
                                                      menuMaxHeight: 200,
                                                      value:
                                                          initialValue_SmallLuggage,
                                                      dropdownColor:
                                                          Colors.white,
                                                      iconEnabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      iconDisabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      items:
                                                          dropdownItems_SmallLuggage
                                                              .map((String
                                                                  items) {
                                                        return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items));
                                                      }).toList(),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 10, 12, 0),
                                                      ),
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                          fontSize: 13),
                                                      onChanged:
                                                          (String? value) {
                                                        selectedNumberOfSmallLuggage =
                                                            value!;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.13,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                          value: check22,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              check22 = value;
                                                            });
                                                          }),
                                                      Text("Medium")
                                                    ],
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    child:
                                                        DropdownButtonFormField(
                                                      menuMaxHeight: 200,
                                                      value:
                                                          initialValue_MediumLuggage,
                                                      dropdownColor:
                                                          Colors.white,
                                                      iconEnabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      iconDisabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      items:
                                                          dropdownItems_MediumLuggage
                                                              .map((String
                                                                  items) {
                                                        return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items));
                                                      }).toList(),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 10, 12, 0),
                                                      ),
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                          fontSize: 13),
                                                      onChanged:
                                                          (String? value) {
                                                        selectedNumberOfMediumLuggage =
                                                            value!;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.13,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Checkbox(
                                                          value: check33,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              check33 = value;
                                                            });
                                                          }),
                                                      Text("Large")
                                                    ],
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    child:
                                                        DropdownButtonFormField(
                                                      menuMaxHeight: 200,
                                                      value:
                                                          initialValue_LargeLuggage,
                                                      dropdownColor:
                                                          Colors.white,
                                                      iconEnabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      iconDisabledColor:
                                                          const Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                      items:
                                                          dropdownItems_LargeLuggage
                                                              .map((String
                                                                  items) {
                                                        return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items));
                                                      }).toList(),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    45,
                                                                    50,
                                                                    89),
                                                          ),
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 10, 12, 0),
                                                      ),
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              24, 25, 84, 1),
                                                          fontSize: 13),
                                                      onChanged:
                                                          (String? value) {
                                                        selectedNumberOfLargeLuggage =
                                                            value!;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorsRes.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 12),
                          blurRadius: 12,
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width * 2, 200)),
                    ),
                  ),
                  Center(
                    child: Material(
                      color: ThemeColors.green,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      elevation: 16,
                      child: InkWell(
                        onTap: () {
                          _ridesController.searchFrom =
                              _fromEditingController.text.obs;
                          _ridesController.searchTo =
                              _toEditingController.text.obs;
                          _ridesController.searchDate =
                              _dateEditingController.text.obs;

                          /// assign values to the pick up location and destination
                          pickUpLocation = _fromEditingController.text.trim();
                          destination = _toEditingController.text.trim();

                          Get.to(() {
                            return ResultPage(
                                originToCompare: pickUpLocation,
                                destinationToCompare: destination);
                          });
                        },
                        splashColor: Colors.orange,
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            'SEARCH',
                            style: GoogleFonts.overpass(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          decoration: DesignConfig.buttonShadowColor(
                              ColorsRes.continueShoppingGradient2Color,
                              37,
                              Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTravellersView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'NUMBER OF PASSENGERS',
              style: GoogleFonts.overpass(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            width: 10,
          ),

          /// dropdown to select the number of passengers
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.18,
            child: DropdownButtonFormField(
              value: initialValue,
              dropdownColor: Colors.white,
              iconEnabledColor: const Color.fromRGBO(24, 25, 84, 1),
              iconDisabledColor: const Color.fromRGBO(24, 25, 84, 1),
              items: dropdownItems.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 45, 50, 89),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 45, 50, 89),
                  ),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              ),
              style: const TextStyle(
                  color: Color.fromRGBO(24, 25, 84, 1), fontSize: 13),
              onChanged: (String? value) {
                selectedNumberOfPassengers = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              DateTime.parse(_dateEditingController.text)
                  .day
                  .toString()
                  .padLeft(2, '0'),
              style: GoogleFonts.overpass(
                  fontSize: 48, color: ColorsRes.orangeColor),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Date',
                  style: GoogleFonts.overpass(
                      fontSize: 16, color: ColorsRes.orangeColor),
                ),
                Container(
                  width: 100.0,
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    format: DateFormat('yyyy-MM-dd'),
                    onChanged: (value) {
                      setState(() {
                        _dateEditingController.text = value.toString();
                      });
                    },
                    inputType: InputType.date,
                    initialTime: TimeOfDay(hour: 8, minute: 0),
                    initialValue: DateTime.parse(_dateEditingController.text),
                    enabled: true,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Time',
                  style: GoogleFonts.overpass(
                      fontSize: 16, color: ColorsRes.orangeColor),
                ),
                Container(
                  width: 100.0,
                  child: FormBuilderDateTimePicker(
                    name: 'time',
                    onChanged: (value) {
                      setState(() {
                        _timeEditingController.text = value.toString();
                      });
                    },
                    inputType: InputType.time,
                    initialTime: TimeOfDay(hour: 8, minute: 0),
                    initialValue: DateTime.parse(_timeEditingController.text),
                    enabled: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFromSelector(locationInfo locationInfo, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                locationInfo.locationCode.toString(),
                style: GoogleFonts.overpass(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black54),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Pickup Location",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: GoogleFonts.overpass(
                        fontSize: 24, color: Colors.black87),
                    controller: _fromEditingController,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(
          icon,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget buildToSelector(locationInfo locationInfo, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                locationInfo.locationCode.toString(),
                style: GoogleFonts.overpass(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black54),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Destination",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    style: GoogleFonts.overpass(
                        fontSize: 24, color: Colors.black87),
                    controller: _toEditingController,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(icon),
      ],
    );
  }
}
