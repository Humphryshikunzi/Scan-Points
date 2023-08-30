import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/StringsRes.dart';
import 'package:pamride/pages/mobile/signup_page.dart';
import 'package:pamride/pages/mobile/login_page.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class PreSignUpPage extends StatefulWidget {
  final bool backButtonEnabled;

  const PreSignUpPage({Key? key, required this.backButtonEnabled})
      : super(key: key);

  @override
  _PreSignUpPage createState() => _PreSignUpPage();
}

class _PreSignUpPage extends State<PreSignUpPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
    analytics.setCurrentScreen(screenName: "Login");
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
      backgroundColor: ColorsRes.black,
      body: WillPopScope(
        onWillPop: _backPress,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SignupActivity());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: ColorsRes.secondaryColor),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorsRes.blackTransparentColor),
                            child: Center(
                              child: Image.asset(
                                "assets/images/people.png",
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: ColorsRes.secondaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'With Entema, you will belong to your team\n when you come to the stadium',
                              style: TextStyle(color: ColorsRes.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Your individual pages here
                    Container(
                      child: Column(children: [
                        SizedBox(
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorsRes.blackTransparentColor),
                          child: Center(
                            child: Image.asset(
                              "assets/images/qr_code.png",
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: ColorsRes.secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text('And earn points by scanning our QR code',
                              style: TextStyle(color: ColorsRes.white)),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 2, // Number of pages
                position: _currentPage,
                decorator: DotsDecorator(
                  color: Colors.grey, // Inactive dot color
                  activeColor: ColorsRes.secondaryColor, // Active dot color
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /// the Login button
              Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 25),
                  child: IntrinsicHeight(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(CupertinoPageRoute(
                                builder: (context) => LoginActivity(
                                      backButtonEnabled: false,
                                    )));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.9,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        alignment: Alignment.center,
                        decoration: DesignConfig.buttonShadowColor(
                            ColorsRes.secondaryColor,
                            37,
                            ColorsRes.secondaryColor),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  )),

              /// sign up section
              RichText(
                  text: TextSpan(
                      style: new TextStyle(color: ColorsRes.white),
                      text: StringsRes.donthvac,
                      children: <TextSpan>[
                    TextSpan(
                        text: StringsRes.lblsignup,
                        style: TextStyle(color: ColorsRes.secondaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => SignupActivity());
                          }),
                  ])),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
