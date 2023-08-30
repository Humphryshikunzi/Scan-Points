import 'package:flutter/material.dart';
import 'package:pamride/utilities/themeStyles.dart';
import 'package:pamride/widgets/dropDown.dart';

class SortingDetails extends StatefulWidget {
  const SortingDetails({Key? key}) : super(key: key);

  @override
  _SortingDetailsState createState() => _SortingDetailsState();
}

class _SortingDetailsState extends State<SortingDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Sort by:', style: ThemeStyles.dropDownTextStyle),
                  const SizedBox(width: 10.0),
                  DropDown('Price')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
