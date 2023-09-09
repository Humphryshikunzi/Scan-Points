import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/Language_Constants.dart';
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
    Color inputBackgroundColor =
        Theme.of(context).brightness == Brightness.light
            ? Colors.white // Light mode background color
            : Colors.black; // Dark mode background color

    Color borderColor = Theme.of(context).brightness == Brightness.light
        ? ColorsRes.secondaryColor // Light mode background color
        : ColorsRes.grayColor; // Dark mode background color

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                          right: 15,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set the border radius
                              ),
                              elevation:
                                  2, // Adjust the elevation for the card shadow
                              color: Theme.of(context)
                                  .canvasColor, // Use the theme's card color
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    8), // Adjust padding as needed
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color, // Use the theme's icon color
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
                            isDarkMode
                                ? "assets/images/logo.png"
                                : "assets/images/logo_light.jpeg",
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          translation(context).appName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .merge(TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// sign up text
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          translation(context).signUp,
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
                          translation(context).pleaseSignUp,
                          style: Theme.of(context).textTheme.titleLarge!.merge(
                              TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
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
                                      translation(context).usernameHint,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color:
                                          inputBackgroundColor, // Use the determined color here
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: translation(context).username,
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5),
                                        ),
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
                                      translation(context).email,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  /// email textfield
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color:
                                          inputBackgroundColor, // Use the determined color here
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText:
                                            translation(context).emailHint,
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: edtemail,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Choose your Club",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
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
                                          decoration: BoxDecoration(
                                            color:
                                                inputBackgroundColor, // Use the determined color here
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: borderColor,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(top: 2),
                                          padding: EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 100,
                                            child: SingleChildScrollView(
                                              child: DropdownButton(
                                                value: edtClub,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    edtClub =
                                                        newValue.toString();
                                                  });
                                                },
                                                items: Clubs.map<
                                                    DropdownMenuItem<String>>(
                                                  (Map<String, String> club) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: club['name'],
                                                      child: Text(
                                                        "(" +
                                                            club['name']
                                                                .toString() +
                                                            ")" +
                                                            club['sname']!,
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
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
                                      translation(context).passwordHint,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color:
                                          inputBackgroundColor, // Use the determined color here
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      obscureText: _obscureText,
                                      controller: edtpsw,
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText:
                                            translation(context).passwordHint,
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5),
                                        ),
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
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),

                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color:
                                          inputBackgroundColor, // Use the determined color here
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius:
                                              3, // Set the specified blur radius
                                          spreadRadius:
                                              1, // Set the specified spread radius
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      obscureText: _conobscureText,
                                      controller: edtcpsw,
                                      style: TextStyle(
                                          color: ColorsRes.black, fontSize: 16),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText:
                                            translation(context).confirmPassord,
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5),
                                        ),
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
                                          decoration: BoxDecoration(
                                            color: ColorsRes.secondaryColor,
                                            borderRadius: BorderRadius.circular(
                                                10), // Set the corner radius here
                                            boxShadow: [
                                              BoxShadow(
                                                  // Shadow properties...
                                                  ),
                                            ],
                                          ),
                                          child: Text(
                                            translation(context).signUp,
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
                                            color: ColorsRes.secondaryColor),
                                        text: translation(context).haveAccount +
                                            " ",
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: translation(context).signIn,
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
        fontSize: 16.0);
  }
}
