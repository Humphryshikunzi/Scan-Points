import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/widgets/pamride_navigation_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final _key = UniqueKey();

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
    analytics.setCurrentScreen(screenName: "Privacy Policy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          title: Text(
            "Privacy Policy",
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
        body: Container(
          margin: EdgeInsets.only(right: 2),
          child: Column(
            children: [
              Expanded(
                  child: WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: Constant.privacyPolicyUrl))
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: whatsAppFloatingActionButton(50, 50, null),
          ),
        ));
  }
}
