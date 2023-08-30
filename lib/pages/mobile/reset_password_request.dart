import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/pages/mobile/otp_page.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class ResetPasswordRequest extends StatefulWidget {
  final bool backButtonEnabled = true;

  const ResetPasswordRequest({
    Key? key,
  }) : super(key: key);

  @override
  _ResetPasswordRequestState createState() => _ResetPasswordRequestState();
}

class _ResetPasswordRequestState extends State<ResetPasswordRequest> {
  final _formKey = GlobalKey<FormState>();

  AccountController _accountController = Get.put(AccountController());
  TextEditingController edtPhone = TextEditingController();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    analytics.setCurrentScreen(screenName: "Reset Password Request");
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  void initializeHive() async {
    await initHiveForFlutter();
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
                  height: MediaQuery.of(context).size.height * 0.4,
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
                            "Reset Password",
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

                        /// phonenumber text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter Phone number linked to your account",
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        /// phone textfield
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.9,
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 10, 10, 10, 10),
                          margin: EdgeInsets.only(top: 7),
                          padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          child: TextFormField(
                            style:
                                TextStyle(color: ColorsRes.black, fontSize: 16),
                            cursorColor: ColorsRes.black,
                            decoration: InputDecoration(
                              hintText: 'e.g. 07********',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsRes.grayColor.withOpacity(0.5)),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: edtPhone,
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              if (edtPhone.text.isEmpty ||
                                  edtPhone.text.length < 10)
                                {
                                  Get.snackbar('Error',
                                      'Kindly enter the correct phonenumber.')
                                }
                              else
                                {
                                  Get.off(Otp(
                                    isDriver: false,
                                    isPasswordReset: true,
                                    phoneNumber: edtPhone.text,
                                    email: _accountController.email.value!,
                                  ))
                                }
                            },
                            child: Text("Next"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orangeAccent),
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
