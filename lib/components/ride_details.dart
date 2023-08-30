import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/rides_controller.dart';
import 'package:pamride/utilities/themeStyles.dart';

class RideDetails extends StatefulWidget {
  @override
  _RideDetailsState createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  RidesController _ridesController = Get.find<RidesController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_ridesController.searchFrom.value,
                  style: ThemeStyles.departureTextStyle),
              Text('', style: ThemeStyles.travelDateTextStyle)
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text('to', style: ThemeStyles.dropDownTextStyle),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Text(_ridesController.searchTo.value,
                  style: ThemeStyles.arrivalTextStyle)
            ],
          )
        ],
      ),
    );
  }
}
