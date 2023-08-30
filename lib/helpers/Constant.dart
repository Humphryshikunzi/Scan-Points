import 'dart:convert';
import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'ColorsRes.dart';
import 'StringsRes.dart';

class Constant {
  final link = HttpLink("https://api.pamride.com/graphql");
  final client = Client(link: HttpLink("https://api.pamride.com/graphql"));

  static String algolia_api_key = dotenv.env['ALGOLIA_API_KEY']!;
  static String algolia_app_id = dotenv.env['ALGOLIA_APP_ID']!;
  static String algolia_index_name = dotenv.env['ALGOLIA_INDEX_NAME']!;
  static String appSecret = dotenv.env['APP_SECRET']!;
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String bookingRequestUrl = dotenv.env['BOOKING_REQUEST_URL']!;
  static String bookingRequestSeatStillAvailableUri = dotenv.env['BOOKING_REQUEST_SEAT_STILL_AVAILBLE_URL']!;
  static String bookingUrl = dotenv.env['BOOKING_URL']!;
  static String callbackUrl = dotenv.env['CALLBACK_URL']!;
  static String carImageUrl = dotenv.env['CAR_IMAGE_URL']!;
  static String currencysymbol = "\$";
  static String driverApproveBookingUrl =
      dotenv.env['Driver_Approve_BOOKING_URL']!;
  static String driverCancelBookingUrl = dotenv.env['DRIVER_CANCEL_BOOKING']!;
  static String driverInitiateRideWithdrawal =
      dotenv.env['DRIVER_INITIATE_WITHDRAWAL']!;
  static String driverRejectBookingUrl =
      dotenv.env['Driver_Reject_BOOKING_URL']!;
  static String forgotpasswordurl = dotenv.env['FORGOT_PASSWORD_URL']!;
  static String googleMapsAPIKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  static String googlePlayUrl = dotenv.env['GOOGLE_PLAY_URL']!;
  static String imagepath = dotenv.env['IMAGE_PATH']!;
  static String mainUrl = dotenv.env['MAIN_URL']!;
  static String passengerCancelBookingUrl =
      dotenv.env['PASSENGER_CANCEL_BOOKING']!;
  static String passengerSuspendRide = dotenv.env['PASSENGER_SUSPEND_RIDE']!;
  static String privacyPolicyUrl = dotenv.env['PRIVACY_POLICY_URL']!;
  static String profileImageUrl = dotenv.env['PROFILE_IMAGE_URL']!;
  static String profileImageUrl2 = dotenv.env['PROFILE_IMAGE_URL_2']!;
  static String profilePostUrl = dotenv.env['PROFILE_POST_URL']!;
  static String recurringRide = dotenv.env['RECURRING_RIDE']!;
  static String shareApp = dotenv.env['SHARE_APP']!;
  static String termsandconditionsurl = dotenv.env['TERMS_AND_CONDITIONS_URL']!;
  static String sosCall = dotenv.env['SOS_CALL']!;
  static String support = dotenv.env['SUPPORT']!;
  static String verifyPaymentUrl = dotenv.env['VERIFY_PAYMENT_URL']!;
  static String webSocketUrl = dotenv.env['WEB_SOCKET_URL']!;


  static String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value))
      return '${StringsRes.entervalidemail}';
    else
      return null;
  }

  static String setFirstLetterUppercase(String? value) {
    return value == null || value.isEmpty
        ? ""
        : "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  static String formatDateFromServer(String serverTime) {
    DateTime dateTime =
        serverTime.isDateTime ? DateTime.parse(serverTime) : DateTime.now();
    String formattedDate =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
    return formattedDate;
  }

  static var monthNames =
      '["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]';
  static var monthname = json.decode(monthNames);

  static Color getOrderStatusColor(int statusid) {
    Color defaultcolor = ColorsRes.green;

    switch (statusid) {
      case 1:
        defaultcolor = ColorsRes.continueShoppingGradient1Color;
        break;
      case 2:
        defaultcolor = ColorsRes.orangeColor;
        break;
      case 4:
        defaultcolor = ColorsRes.continueShoppingGradient1Color;
        break;
      case 8:
        defaultcolor = ColorsRes.orangeColor;
        break;
      case 9:
        defaultcolor = ColorsRes.orangeColor;
        break;
      case 11:
        defaultcolor = ColorsRes.orangeColor;
        break;
      case 12:
        defaultcolor = ColorsRes.orangeColor;
        break;
      case 10:
        defaultcolor = ColorsRes.orangeColor;
        break;
      default:
        defaultcolor = ColorsRes.green;
        break;
    }
    return defaultcolor;
  }

  static String formatKenyanPhoneNumber(String phoneNumber) {
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.startsWith('7')) {
      digitsOnly = '07${digitsOnly.substring(1)}';
    } else if (digitsOnly.startsWith('1')) {
      digitsOnly = '01${digitsOnly.substring(1)}';
    } else if (digitsOnly.startsWith('2547')) {
      digitsOnly = '0${digitsOnly.substring(3)}';
    } else if (digitsOnly.startsWith('2541')) {
      digitsOnly = '01${digitsOnly.substring(3)}';
    }
    return digitsOnly;
  }
}
