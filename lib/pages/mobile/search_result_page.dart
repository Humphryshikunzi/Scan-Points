import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/components/ride_details.dart';
import 'package:pamride/components/sorting_details.dart';
import 'package:pamride/components/tabs.dart';
import 'package:pamride/controllers/reponsiveness.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/GrobagColor.dart'; 

class ResultPage extends StatefulWidget {
  /// modfication of the constructor to rececive a value (Location Clicked) from the Landing page
  final String originToCompare;
  final String destinationToCompare;
  final bool? sortByPrice;
  ResultPage(
      {this.originToCompare = '',
      this.destinationToCompare = '',
      this.sortByPrice,
      Key? key})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool? sortByPrice;

  @override
  initState() {
    super.initState();
    sortByPrice = widget.sortByPrice ?? false;
  }

  @override
  Widget build(BuildContext context) {
    String titleOrigin = widget.originToCompare.length > 13
        ? widget.originToCompare.substring(0, 12) + '...'
        : widget.originToCompare;
    String titleDestination = widget.destinationToCompare.length > 13
        ? widget.destinationToCompare.substring(0, 12) + '...'
        : widget.destinationToCompare;

    String title;
    if (titleOrigin != '' && titleDestination != '') {
      title = titleOrigin + ' - ' + titleDestination;
    } else {
      if (titleOrigin == '' && titleDestination == '') {
        title = 'Available rides';
      } else {
        title = titleOrigin;
      }
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,

      // define the app bar
      appBar: AppBar(
        backgroundColor: ColorsRes.backgroundColor,
        // the back button on the app bar
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        // title on the app bar
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              Text(
                'Sort by price',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: fontColor),
              ),
              Switch(
                  activeColor: ColorsRes.continueShoppingGradient2Color,
                  value: sortByPrice!,
                  onChanged: (value) {
                    setState(() {
                      sortByPrice = value;
                      if (sortByPrice == true) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultPage(
                              originToCompare: widget.originToCompare,
                              destinationToCompare: widget.destinationToCompare,
                              sortByPrice: sortByPrice,
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultPage(
                              originToCompare: widget.originToCompare,
                              destinationToCompare: widget.destinationToCompare,
                              sortByPrice: sortByPrice,
                            ),
                          ),
                        );
                      }
                      // sort items here by price
                    });
                  })
            ],
          ),
        ],
      ),
      // the body of the screen
      body: ResponsiveWidget.isSmallScreen(context)
          ? Stack(
              children: <Widget>[
                /*
                This container carries each ride with its details
                The Ticket() class wraps the details of each ride e.g, origin, destination, estimated price
                */
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5.0),
                    ],
                  ),
                )
              ],
            )
          : Stack(
              children: <Widget>[
                Container(
                  height: 490.0,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45.0),
                          bottomRight: Radius.circular(45.0))),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      SizedBox(height: 10.0),
                      RideDetails(),
                      SizedBox(height: 20.0),
                      SortingDetails(),
                      SizedBox(height: 15.0),
                      MyTabs(),
                      SizedBox(height: 10.0), 
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
