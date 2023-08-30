import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MissionVision extends StatefulWidget {
  const MissionVision({Key? key}) : super(key: key);

  @override
  State<MissionVision> createState() => _MissionVisionState();
}

class _MissionVisionState extends State<MissionVision> {
  String url = "https://pamride.com/mission.html";

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
    analytics.setCurrentScreen(screenName: "Mission & Vision");
  }

  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          title: Text(
            "Mission & Vision",
            style: TextStyle(color: Colors.black),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: url))
          ],
        ));
  }
}
