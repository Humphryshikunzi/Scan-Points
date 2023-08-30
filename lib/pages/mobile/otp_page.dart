import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/pages/mobile/add_profile_page.dart';
import 'package:pamride/pages/mobile/reset_password.dart';
import 'package:pamride/pages/mobile/verification_page.dart';
import 'package:pamride/widgets/Alert.dart';
import 'package:pamride/widgets/DialogButton.dart';
import 'package:pamride/widgets/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/constant.dart';
import '../../graphql/__generated__/operations.req.gql.dart';

class Otp extends StatefulWidget {
  String phoneNumber;
  String email;
  bool isDriver;
  bool? isPasswordReset;

  Otp(
      {required String this.phoneNumber,
      required String this.email,
      required bool this.isDriver,
      this.isPasswordReset});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String? unformatedPhone;
  String smsOTP = '';
  String verificationIdG = '';
  String errorMessage = '';

  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  late TextEditingController controller5;
  late TextEditingController controller6;

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();

  ClientController _clientController = Get.find<ClientController>();

  @override
  void initState() {
    super.initState();
    formatPhone();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
    sendOTP();
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    unformatedPhone = _prefs.getString('phone');
  }

  formatPhone() {
    if (widget.phoneNumber.startsWith("0")) {
      widget.phoneNumber = widget.phoneNumber.replaceFirst("0", "+254");
    }
  }

  sendOTP() {
    final sendOTPReq = GSendOTPReq((b) => b
    ..vars.phone = widget.phoneNumber 
    ..vars.email = widget.email);
    _clientController.client.request(sendOTPReq).listen((event) {
      if (!event.loading) {
        smsOTP = event.data!.verificationCode;
      }
    });
  }

  checkOTP() {
    final code = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text +
        controller6.text;
    if (code == smsOTP) {
      if (widget.isPasswordReset == true) {
        Get.off(ResetPassword(
          phonenumber: widget.phoneNumber,
        ));
      } else {
        updatePhonenumber();
      }
    } else {
      Get.snackbar("Error", "OTP Mismatch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: fixPadding * 17.0),
            child: ListView(
              children: [
                Text(
                  'Phone Verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  'Please Wait for a Verification Code',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: fixPadding,
                    left: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    bottom: fixPadding * 4.0,
                  ),
                  child: Text(
                    'Please check your messages and \nenter the verification code we sent to \n${widget.phoneNumber} or ${widget.email}',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
                  ),
                ),
                otpTextField(),
                SizedBox(
                  height: 20,
                ),
                widget.isPasswordReset == true
                    ? InkWell(
                        onTap: () => _requestNewCode(),
                        child: Padding(
                          padding: const EdgeInsets.all(fixPadding),
                          child: Text(
                            'Resend Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () => _changeNumber(context),
                        child: Padding(
                          padding: const EdgeInsets.all(fixPadding),
                          child: Text(
                            'Resend Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.0,
                ),
                submitButton(context),
              ],
            ),
          ),
          Container(
            height: 210.0,
            child: Center(
              child: Lottie.asset('assets/assets/otp.json'),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 20.0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  otpTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: firstFocusNode,
              onChanged: (v) {
                String value = controller1.text;
                if (value.isEmpty) {
                  return;
                }
                FocusScope.of(context).requestFocus(secondFocusNode);
              },
              controller: controller1,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: secondFocusNode,
              onChanged: (v) {
                String value = controller2.text;
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(firstFocusNode);
                  return;
                }
                FocusScope.of(context).requestFocus(thirdFocusNode);
              },
              controller: controller2,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: thirdFocusNode,
              onChanged: (v) {
                String value = controller3.text;
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(secondFocusNode);
                  return;
                }
                FocusScope.of(context).requestFocus(fourthFocusNode);
              },
              controller: controller3,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: fourthFocusNode,
              onChanged: (v) {
                String value = controller4.text;
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(thirdFocusNode);
                  return;
                }
                FocusScope.of(context).requestFocus(fifthFocusNode);
              },
              controller: controller4,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: fifthFocusNode,
              onChanged: (v) {
                String value = controller5.text;
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(fourthFocusNode);
                  return;
                }
                FocusScope.of(context).requestFocus(sixthFocusNode);
              },
              controller: controller5,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.4),
                  primaryColor.withOpacity(0.4),
                ],
              ),
            ),
            child: TextField(
              focusNode: sixthFocusNode,
              onChanged: (v) {
                String value = controller6.text;
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(fifthFocusNode);
                  return;
                }
                waitDialog();
              },
              controller: controller6,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  submitButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 4.0,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        onTap: () => waitDialog(),
        child: Container(
          padding: EdgeInsets.all(fixPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  waitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contxet) {
        return Dialog(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Please Wait...',
                    style: TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                ],
              ),
            ],
          ),
        );
      },
    );
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pop();
        checkOTP();
      },
    );
  }

  _requestNewCode() {
    Get.snackbar(
        "New Code", "A new code has been sent to ${widget.phoneNumber} and ${widget.email}");
    sendOTP();
  }

  ///Change user phone number format.
  _changeNumber(context) {
    TextEditingController _phoneEditingController = TextEditingController();
    Alert(
      context: context,
      type: AlertType.info,
      title: "Enter Phone Number",
      content: TextField(
        keyboardType: TextInputType.phone,
        controller: _phoneEditingController,
        style: TextStyle(
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
            hintText: 'Use the format: 2547********',
            errorText: _phoneEditingController.text.obs.string.length < 10
                ? 'Enter the correct phone number format'
                : null),
        cursorColor: ColorsRes.gradientOneColor,
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            if (_phoneEditingController.text.length < 10) {
              Get.snackbar("Error", "Enter the correct phone number format");
            } else {
              widget.phoneNumber = _phoneEditingController.text.obs.string;
              Get.snackbar("New Code",
                  "A new code has been sent to ${widget.phoneNumber}");
              sendOTP();
            }

            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          gradient: LinearGradient(
              colors: [ColorsRes.gradientOneColor, ColorsRes.gradientTwoColor]),
        ),
      ],
    ).show();
  }

  void updatePhonenumber() async {
    formatPhone();
    SVProgressHUD.show(status: 'Updating...');
    final updateUserDetailsReq = GUpdateUserPhoneNumberReq((b) => b
      ..vars.phoneNumber = widget.phoneNumber
      ..vars.email = widget.email);
    _clientController.client.request(updateUserDetailsReq).listen((event) {
      if (event.data != null && event.data!.updateUserPhoneNumber.succeeded) {
        AccountController _accountController = Get.find<AccountController>();
        _accountController.phoneNumber.value = widget.phoneNumber;
        if (widget.isDriver) {
          Get.off(() => VerificationPage());
        } else {
          Get.off(() => AddProfilePage(
                isDriver: false,
              ));
        }
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Oops',
            message:
                'An error occurred while updating your phonenumber details, ${widget.phoneNumber}, ${widget.email}',
            icon: Icon(
              Icons.info_outline,
              color: Colors.red,
            ),
            duration: Duration(seconds: 3),
          ),
        );
      }
      SVProgressHUD.dismiss();
    });
  }
}
