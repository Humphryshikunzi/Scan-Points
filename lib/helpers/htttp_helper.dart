import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http/http.dart' as http;
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class HttpHelper {
  Future<Map<String, dynamic>> uploadFile(
      {required File file,
      required String name,
      required String uploadType,
      required String extension,
      required String userId,
      required Function(int sentBytes, int totalBytes) onProgress}) async {
    String token = await getAuthToken();

    Dio dio = new Dio();
    dio.options.baseUrl = Constant.profilePostUrl;
    dio.options.connectTimeout = 30000; //5s
    dio.options.receiveTimeout = 30000;
    dio.options.headers["Authorization"] = "Bearer $token";

    FormData formData = new FormData.fromMap({
      "Name": name,
      "UploadType": uploadType,
      "Extension": extension,
      "UserId": userId,
      "Files": await MultipartFile.fromFile(file.path, filename: name),
    });

    var response = await dio.post(
      Constant.profilePostUrl,
      data: formData,
      onSendProgress: (sentBytes, totalBytes) {
        onProgress(sentBytes, totalBytes);
      },
    );
    if (response.statusCode == 201) {
      debugPrint(response.data.toString());
      debugPrint("Image Uploaded");
      return {
        "complete": true,
        "fileName": response.data['fileName'],
      };
    } else {
      debugPrint(
          "Upload Failed: ${response.statusMessage} Code: ${response.statusCode}");
      return {
        "complete": false,
        "fileName": '',
      };
    }
  }

  Future<bool> passengerFinishBooking({
    required String transactionId,
  }) async {
    SVProgressHUD.show(status: 'Finishing booking...');
    String url = Constant.bookingUrl + '/$transactionId';
    String token = await getAuthToken();

    var response = await http.post(Uri.parse(url), body: null, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: "${response.body}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      Get.snackbar('Failed',
          'There was an error finishing your booking. Please try again later.');
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text:
            "There was an error finishing your booking. Please try again later.",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> passengerCancelBooking(
      {required String passengerId,
      required String rideId,
      required String reason,
      required String transactionId,
      required List<String> seats}) async {
    SVProgressHUD.show(status: 'Cancelling...');

    String body = jsonEncode({
      "passengerId": passengerId,
      "RideId": rideId,
      "ReasonForCancel": reason,
      "CancelledSeats": seats
    });
    String url = Constant.passengerCancelBookingUrl + '/$transactionId';
    String token = await getAuthToken();

    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: "${response.body}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      Get.snackbar('Failed',
          'There was an error cancelling your booking. Please try again later.');
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text:
            "There was an error cancelling your booking. Please try again later.",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> driverCancelBooking(
      {required String driverId,
      required String rideId,
      required String reason,
      required bool isCancelled,
      required List<String> seats}) async {
    SVProgressHUD.show(status: 'Cancelling...');

    String body = jsonEncode({
      "DriverId": driverId,
      "IsCancelled": isCancelled,
      "RideId": rideId,
      "ReasonForCancel": reason,
      "CancelledSeats": seats,
    });

    String url = Constant.driverCancelBookingUrl;
    String token = await getAuthToken();

    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: " ${response.body}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      Get.snackbar('Failed',
          'There was an error cancelling your ride. Please try again later.');
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text: " ${response.body}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> driverInitiateRideWithdrawal({
    required String driverId,
    required String rideId,
  }) async {
    SVProgressHUD.show(status: 'Requesting Withdrawal...');
    String body = jsonEncode({
      "driverId": driverId,
      "rideId": rideId,
    });
    String url = Constant.driverInitiateRideWithdrawal;
    String token = await getAuthToken();
    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> driverHandleRecurringRide({
    required int rideId,
    required bool state,
  }) async {
    SVProgressHUD.show(status: 'Changing ride recurrence state...');
    String url = Constant.recurringRide + '$rideId/$state';
    print('url \n ' + url);
    String token = await getAuthToken();
    var response = await http.post(Uri.parse(url), body: null, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> passengerSuspendRide({
    required String passengerId,
    required String rideId,
  }) async {
    SVProgressHUD.show(status: 'Please wait');

    String body = jsonEncode({
      "passengerId": passengerId,
      "rideId": rideId,
    });

    String url = Constant.passengerSuspendRide;
    String token = await getAuthToken();

    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text: " ${jsonDecode(response.body)['detail']}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }

  Future<bool> passengerRateTrip(
      {required String passengerId,
      required String rideId,
      required String reason,
      required List<String> seats}) async {
    SVProgressHUD.show(status: 'Rating trip...');

    String body = jsonEncode({
      "passengerId": passengerId,
      "RideId": rideId,
      "ReasonForCancel": reason,
      "CancelledSeats": seats
    });
    String url = Constant.passengerCancelBookingUrl;
    String token = await getAuthToken();

    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      QuickAlert.show(
        context: Get.context!,
        title: "Success!",
        text: "${response.body}",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.success,
      );
      return true;
    } else {
      SVProgressHUD.dismiss();
      Get.snackbar('Failed',
          'There was an error cancelling your booking. Please try again later.');
      QuickAlert.show(
        context: Get.context!,
        title: "Failed",
        text:
            "There was an error cancelling your booking. Please try again later.",
        confirmBtnColor: Colors.orange,
        confirmBtnText: "Close",
        onConfirmBtnTap: () {
          Get.back();
        },
        type: QuickAlertType.error,
      );
      return false;
    }
  }
}
