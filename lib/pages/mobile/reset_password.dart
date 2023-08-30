import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/StringsRes.dart';
import 'package:pamride/pages/mobile/login_page.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class ResetPassword extends StatefulWidget {
  final bool backButtonEnabled = true;
  final String? phonenumber;

  const ResetPassword({Key? key, required this.phonenumber}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  ClientController _clientController = Get.find<ClientController>();
  bool _obscureText = true, _conobscureText = true;
  bool isLoading = false;

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    analytics.setCurrentScreen(screenName: "Reset Password");
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  void initializeHive() async {
    await initHiveForFlutter();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsRes.black,
        textColor: ColorsRes.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,
      body: WillPopScope(
        onWillPop: _backPress,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter new Credentials",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .merge(TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24)),
                          ),
                        ),
                        SizedBox(height: 25),

                        /// password text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StringsRes.password,
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        /// password textfield
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 10, 10, 10, 10),
                          margin: EdgeInsets.only(top: 2),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: edtpsw,
                            style:
                                TextStyle(color: ColorsRes.black, fontSize: 16),
                            cursorColor: ColorsRes.black,
                            decoration: InputDecoration(
                              hintText: StringsRes.password,
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsRes.grayColor.withOpacity(0.5)),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorsRes.grayColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        /// confirm password text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StringsRes.confirmpassword,
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        /// confirm password textfield
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 10, 10, 10, 10),
                          margin: EdgeInsets.only(top: 2),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            obscureText: _conobscureText,
                            controller: edtcpsw,
                            style:
                                TextStyle(color: ColorsRes.black, fontSize: 16),
                            cursorColor: ColorsRes.black,
                            decoration: InputDecoration(
                              hintText: StringsRes.password,
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsRes.grayColor.withOpacity(0.5)),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _conobscureText = !_conobscureText;
                                  });
                                },
                                child: Icon(
                                  _conobscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorsRes.grayColor,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 100,
                          child: ButtonClickAnimation(
                            onTap: () {
                              if (edtpsw.text.isEmpty) {
                                showToast("Enter password");
                                return;
                              }
                              if (edtcpsw.text.isEmpty) {
                                showToast("Enter confirm password");
                                return;
                              }
                              if (edtpsw.text.length < 6) {
                                showToast(
                                    "Enter password of atleast 6 characters");
                                return;
                              }
                              if (edtpsw.text != edtcpsw.text) {
                                showToast(
                                    "Password and confirm password do not match");
                                return;
                              }
                              print(widget.phonenumber);

                              final resetPasswordRequest =
                                  GChangeUserPasswordReq((b) => b
                                    ..vars.phoneNumber = widget.phonenumber
                                    ..vars.password = edtpsw.text
                                    ..vars.confirmPassword = edtcpsw.text);
                              _clientController.client
                                  .request(resetPasswordRequest)
                                  .listen((response) {
                                if (response.loading) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                                if (response.data != null &&
                                    response.data!.passwordResetRequestByPhone
                                        .succeeded) {
                                  Get.off(LoginActivity(
                                    backButtonEnabled: false,
                                  ));
                                } else {
                                  SVProgressHUD.dismiss();
                                  Get.snackbar("Error",
                                      "${response.data!.passwordResetRequestByPhone.messages[0]}",
                                      snackPosition: SnackPosition.TOP);
                                }
                              });
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                padding: EdgeInsets.only(top: 13, bottom: 13),
                                alignment: Alignment.center,
                                decoration: DesignConfig.buttonShadowColor(
                                    ColorsRes.continueShoppingGradient1Color,
                                    37,
                                    ColorsRes.continueShoppingGradient2Color),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
