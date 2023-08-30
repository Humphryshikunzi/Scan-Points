import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/StringsRes.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'login_page.dart';

class SignupActivity extends StatefulWidget {
  final String? from;

  const SignupActivity({
    Key? key,
    this.from,
  }) : super(key: key);

  @override
  _SignupActivityState createState() => _SignupActivityState();
}

class _SignupActivityState extends State<SignupActivity>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  TextEditingController edtId = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  TextEditingController edtUserName = TextEditingController();

  GlobalKey<ScaffoldState>? scaffoldKey;
  bool _obscureText = true, _conobscureText = true;
  String? edtClub = 'Al-Hilal';
  String? deviceRegToken = '';
  bool isLoading = false;

  @override
  void initState() {
    getDeviceInfo();
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  void getDeviceInfo() async {
    deviceRegToken = await FirebaseMessaging.instance.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.centerRight,
            colors: <Color>[Colors.green, ColorsRes.backgroundColor],
          ),
        ),
        child: Scaffold(
            key: scaffoldKey,
            extendBody: true,
            backgroundColor: Colors.black,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 15,
                            left: 15,
                            right: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              shape: DesignConfig.setRoundedBorder(
                                  ColorsRes.white, 8, false),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: ColorsRes.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Entema',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .merge(TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'انتماء',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .merge(TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .merge(TextStyle(
                                  color: ColorsRes.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hello, please sign up to continue',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .merge(TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 6,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                //top: kToolbarHeight,
                                bottom: 10),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(height: 20),

                                  /// username text
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Username',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorsRes.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  /// username textfield
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: DesignConfig
                                        .boxDecorationContainerShadow(
                                            ColorsRes.containerShadowColor,
                                            10,
                                            10,
                                            10,
                                            10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: 'Enter a unique username',
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: ColorsRes.grayColor
                                                .withOpacity(0.5)),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.name,
                                      controller: edtUserName,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  /// email text
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      StringsRes.lblemail,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorsRes.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  /// email textfield
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: DesignConfig
                                        .boxDecorationContainerShadow(
                                            ColorsRes.containerShadowColor,
                                            10,
                                            10,
                                            10,
                                            10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.youremail,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: ColorsRes.grayColor
                                                .withOpacity(0.5)),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: edtemail,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  /// club and town/city container
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Choose your  Club",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: ColorsRes.black,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: DesignConfig
                                              .boxDecorationContainerShadow(
                                                  ColorsRes
                                                      .containerShadowColor,
                                                  10,
                                                  10,
                                                  10,
                                                  10),
                                          margin: EdgeInsets.only(top: 2),
                                          padding: EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 100,
                                            child: SingleChildScrollView(
                                                child: DropdownButton(
                                              value: edtClub,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  edtClub = newValue.toString();
                                                });
                                              },
                                              items: Clubs.map<
                                                      DropdownMenuItem<String>>(
                                                  (Map<String, String> club) {
                                                return DropdownMenuItem<String>(
                                                  value: club['name'],
                                                  child: Text(
                                                      club['name'].toString()),
                                                );
                                              }).toList(),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),

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
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: DesignConfig
                                        .boxDecorationContainerShadow(
                                            ColorsRes.containerShadowColor,
                                            10,
                                            10,
                                            10,
                                            10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      obscureText: _obscureText,
                                      controller: edtpsw,
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.password,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: ColorsRes.grayColor
                                                .withOpacity(0.5)),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: DesignConfig
                                        .boxDecorationContainerShadow(
                                            ColorsRes.containerShadowColor,
                                            10,
                                            10,
                                            10,
                                            10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      obscureText: _conobscureText,
                                      controller: edtcpsw,
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.password,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: ColorsRes.grayColor
                                                .withOpacity(0.5)),
                                        border: InputBorder.none,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _conobscureText =
                                                  !_conobscureText;
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

                                  /// sign up button
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 20),
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
                                        if (edtpsw.text != edtcpsw.text) {
                                          showToast(
                                              "Password and confirm password do not match");
                                          return;
                                        }
                                        if (edtpsw.text.length < 6) {
                                          showToast(
                                              "Enter password of atleast 6 characters");
                                          return;
                                        }

                                        if (!edtemail.text.isEmail) {
                                          showToast("Invalid email");
                                          return;
                                        }
                                        Get.to(() => HomePage());
                                      },
                                      child: IntrinsicHeight(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          padding: EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          alignment: Alignment.center,
                                          decoration:
                                              DesignConfig.buttonShadowColor(
                                                  ColorsRes.secondaryColor,
                                                  37,
                                                  ColorsRes.secondaryColor),
                                          child: Text(
                                            StringsRes.lblsignup,
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

                                  /// sign in
                                  RichText(
                                    text: TextSpan(
                                        style: new TextStyle(
                                            color: ColorsRes.white),
                                        text: StringsRes.alreadyhvac,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: StringsRes.lblsignin,
                                            style: TextStyle(
                                              color: ColorsRes.secondaryColor,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                if (widget.from ==
                                                    'loginhome') {
                                                  Navigator.of(context).push(
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              LoginActivity(
                                                                backButtonEnabled:
                                                                    true,
                                                              )));
                                                } else {
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
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
}
