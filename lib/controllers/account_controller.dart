import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/pages/mobile/verification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  RxBool isDriver = false.obs;
  RxBool isLoggedIn = false.obs;
  RxString cartAmount = "0".obs;

  /// Account details
  Rx<String?> phoneNumber = "".obs;
  Rx<String?> userName = "".obs;
  Rx<String?> email = "".obs;
  Rx<String> firstName = "".obs;
  Rx<String> lastName = "".obs;
  Rx<String?> accountId = "".obs;
  Rx<String> frontLicenseUrl = "".obs;
  Rx<String> backLicenseUrl = "".obs;

  RxString rideId = "".obs;
  RxBool verifyingPayment = false.obs;
  Rx<String?> token = "".obs;
  RxString from = "".obs;
  RxBool searchParamsOn = false.obs;
  RxString imageName = "".obs;
  RxString car_type = "5 Seater".obs;
  RxString? front_left = null;
  RxString? middle_centre = null;
  RxString? middle_left = null;
  RxString? middle_right = null;
  RxString? back_left = null;
  RxString? back_centre = null;
  RxString? back_right = null;
  RxString userId = "".obs;
  RxBool isUserLoggedInADriver = false.obs;

  Rx<String?> profileImage = "".obs;
  RxList<dynamic> carsList = [].obs;
  Rx<String> sentOTP = "".obs;
  Rx<String> checkourRequestId = "".obs;

  RxBool loadingGrid = false.obs;

  List<String> cars = [];

  Map<String, String> myCars = {};

  bool userFirstOpen = true;

  fetchCarlist() async {
    // var response=await
  }

  fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? userName = prefs.getString('username');
    bool? isUserLoggedInADriverPref = prefs.getBool('isLoggedInUserADriver');

    if (token != null && isUserLoggedInADriverPref != null) {
      isUserLoggedInADriver = isUserLoggedInADriverPref.obs;
      if (userName != null && userFirstOpen) {
        userFirstOpen = false;
        getUserDetails(userName: userName);
      }
      return true;
    } else {
      return false;
    }
  }

  void getUserDetails({required String userName}) {
    ClientController _clientController = Get.find<ClientController>();
    final getUserDetailsReq =
        GGetUserByUserNameReq((b) => b..vars.userName = userName);
    _clientController.client.request(getUserDetailsReq).listen(
      (event) {
        if (event.data != null && event.data!.users.isNotEmpty) {
          final user = event.data!.users.first;
          firstName.value = user.firstName ?? '';
          lastName.value = user.lastName;
          frontLicenseUrl.value =
              user.identificationDocument?.drivingLicenceFront ?? '';
          backLicenseUrl.value =
              user.identificationDocument?.drivingLicenceRear ?? '';
          if (isDriver.isTrue &&
              (backLicenseUrl.value == '' || frontLicenseUrl.value == '')) {
            Get.showSnackbar(
              GetSnackBar(
                title: 'Notice',
                message:
                    'You need to update your licence information before you proceed.',
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.red,
                ),
                duration: Duration(seconds: 3),
              ),
            );
            Get.to(VerificationPage());
          }
        }
      },
    );
  }
}
