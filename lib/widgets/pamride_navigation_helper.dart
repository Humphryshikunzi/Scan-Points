import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp(String? phoneNo, String? messageInput) async {
  var contact = phoneNo ?? "+966 56 233 6688";
  var message = messageInput ?? "Hi, Pamride is cool";
  var androidUrl = "whatsapp://send?phone=$contact&text=$message";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('$message')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    Get.snackbar('Error', 'WhatsApp is not installed.');
  }
}

whatsAppFloatingActionButton(double? height, double? width, String? message) {
  String iconUrl = 'assets/images/whatsapp.png';
  return FloatingActionButton(
    onPressed: () {
      launchWhatsApp(null, message);
    },
    child: Image.asset(
      iconUrl,
      width: width,
      height: height,
    ),
    backgroundColor: ColorsRes.white,
  );
}
