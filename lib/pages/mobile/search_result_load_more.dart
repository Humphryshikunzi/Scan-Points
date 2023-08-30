import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/components/ride_details.dart';
import 'package:pamride/components/sorting_details.dart';
import 'package:pamride/components/tabs.dart';
import 'package:pamride/controllers/reponsiveness.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/widgets/landing_grid.dart';
import '../../components/grid_tickets.dart';

class ResultPageLoadMore extends StatefulWidget {
  const ResultPageLoadMore({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPageLoadMore> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,
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
          "Available Rides",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // the body of the screen
      body: ResponsiveWidget.isSmallScreen(context)
          ? SingleChildScrollView(
              controller: _scrollController,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1000,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 8, right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: LandingGrid(),
                        ),
                      ],
                    ),
                  )))
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
                      GridTickets()
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
