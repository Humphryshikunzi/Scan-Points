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

class RideSearchPage extends StatefulWidget {
  const RideSearchPage({Key? key}) : super(key: key);

  @override
  _RideSearchPageState createState() => _RideSearchPageState();
}

enum TripType { oneway, roundtrip, multicity }

Map<TripType, String> _tripTypes = {
  TripType.oneway: 'ONE WAY',
  TripType.roundtrip: 'ROUNDTRIP',
  TripType.multicity: 'MULTICITY'
};

class _RideSearchPageState extends State<RideSearchPage> {
  TripType _selectedTrip = TripType.oneway;
  TextEditingController _fromEditingController = TextEditingController();
  TextEditingController _toEditingController = TextEditingController();
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _timeEditingController = TextEditingController();
  TextEditingController _travellersEditingController = TextEditingController();
  TextEditingController _weightEditingController = TextEditingController();
  RidesController _ridesController = Get.find<RidesController>();

  @override
  void initState() {
    _timeEditingController.text = DateTime.now().toString();
    _dateEditingController.text = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey _key = GlobalKey<FormState>();
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 6),
                          blurRadius: 6),
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'SEARCH FOR YOUR TRIP',
                      style: GoogleFonts.overpass(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 20.0,
                          child: Container(
                            height: 16.0,
                            width: 16.0,
                            decoration: DesignConfig.buttonShadowColor(
                                Colors.white, 37, Colors.white),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10.0),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FormBuilder(
          key: _key,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(24.0),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: buildFromSelector(
                    locationInfo('From:', 'Nyeri', ''), Icons.location_on),
              ),
              Container(height: 1, color: Colors.black26),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(24.0),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: buildToSelector(
                    locationInfo('To:', 'Nairobi', ''), Icons.location_on),
              ),
              Container(height: 1, color: Colors.black26),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: buildDateSelector('DATE', DateTime.now()),
                    ),
                  ),
                ],
              ),
              Container(height: 1, color: Colors.black26),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: buildTravellersView(),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'LUGGAGE\nWEIGHT(KG)',
                                style: GoogleFonts.overpass(
                                    fontSize: 18, color: Colors.grey),
                              ),
                              Container(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '20',
                                  ),
                                  style: GoogleFonts.overpass(fontSize: 24),
                                  cursorColor: ColorsRes.gradientOneColor,
                                  focusNode: FocusNode(),
                                  controller: _weightEditingController,
                                ),
                              )
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
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 12),
                          blurRadius: 12,
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width * 2, 100)),
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
                          Get.to(() => ResultPage(
                                originToCompare: _fromEditingController.text,
                              ));
                        },
                        splashColor: Colors.orange,
                        child: Container(
                          width: 100,
                          height: 100,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTravellersView() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'NUMBER OF\nTRAVELLERS',
              style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
            ),
            Container(
              width: 100,
              child: FormBuilderTextField(
                decoration: InputDecoration(hintText: '01'),
                controller: _travellersEditingController,
                cursorColor: ColorsRes.gradientOneColor,
                style: GoogleFonts.overpass(fontSize: 24),
                name: 'Travellers',
              ),
            )
          ],
        ),
      ],
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
              style: GoogleFonts.overpass(fontSize: 48),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Date',
                  style: GoogleFonts.overpass(fontSize: 16),
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
                  style: GoogleFonts.overpass(fontSize: 16),
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
        Icon(icon),
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
