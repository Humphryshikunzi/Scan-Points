import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/widgets/pamride_navigation_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: ColorsRes.backgroundColor,
        title: Text(
          "Contact Support",
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
                    initialUrl: Constant.support))
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: whatsAppFloatingActionButton(50, 50, null),
      ),
    );
  }
}
