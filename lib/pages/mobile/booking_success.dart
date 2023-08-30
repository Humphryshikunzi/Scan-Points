import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'home_page.dart';

class BookingSuccess extends StatefulWidget {
  final bool? isPayment;
  BookingSuccess({this.isPayment});

  @override
  State<StatefulWidget> createState() {
    return StateSuccess();
  }
}

class StateSuccess extends State<BookingSuccess> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(screenName: 'Booking Success');

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsRes.backgroundColor,
        title: Row(
          children: [
            BackButton(
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Booking  Placed',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isPayment == true
                ? Text('Payment Successful')
                : Text('Your trip has been booked successfully.',
                    style: TextStyle(
                      color: fontColor,
                    )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.isPayment == true
                  ? Text(
                      'You are now eligible for travel with the driver, safe journey')
                  : Text('You will be notified when the driver approves. ',
                      style: TextStyle(color: fontColor, fontSize: 14)),
            ),
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(vertical: 40),
              child: Lottie.asset('assets/booking_placed.json'),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Enjoy your trip!"),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: new Container(
                margin: EdgeInsets.all(20),
                height: 48,
                decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text("Back Home",
                      style: TextStyle(
                        color: white,
                      )),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    ModalRoute.withName('/'));
              },
            ),
          ],
        )),
      ),
    );
  }
}
