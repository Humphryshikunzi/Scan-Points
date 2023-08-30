import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/widgets/pamride_navigation_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../helpers/ColorsRes.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final _key = UniqueKey();

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          title: Text(
            "Terms & Conditions",
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
                      initialUrl: Constant.termsandconditionsurl))
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
