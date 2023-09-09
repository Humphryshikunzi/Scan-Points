import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pamride/components/messages/preferences.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/widgets/change_them_button.dart';

class MessageActivity extends StatefulWidget {
  MessageActivity({Key? key}) : super(key: key);

  @override
  _MessageActivityState createState() => _MessageActivityState();
}

class _MessageActivityState extends State<MessageActivity> {
  MessagePreference _messagePreference = Get.find<MessagePreference>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  int chatCount = 0;
  List<String> images = [];
  List<String> deviceTokens = [];
  bool isOnline = false;
  bool isDbSynched = false;
  Map<String, dynamic> userMessages = {};
  bool isMessagesLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          translation(context).history,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: [ChangeThemeButtonWidget()],
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                  'Relax, you will be able to use the scanned points to redeem rewards soon! Like buying staff from our partners that have our QR code!'),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}

class NotFoundPlaceHolder extends StatelessWidget {
  final String message;
  final double? iconHeight;

  const NotFoundPlaceHolder({
    Key? key,
    required this.message,
    this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Lottie.asset(
              'assets/assets/no-message.json',
              height: iconHeight ?? MediaQuery.of(context).size.height / 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
