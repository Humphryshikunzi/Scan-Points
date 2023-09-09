import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/Language.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/main.dart';
import 'package:pamride/pages/mobile/signup_page.dart';
import 'package:pamride/pages/mobile/login_page.dart';
import 'package:pamride/widgets/change_them_button.dart';

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
      body: WillPopScope(
        onWillPop: _backPress,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),

            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChangeThemeButtonWidget(),
                DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                  ),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      Locale _locale = await setLocale(language.languageCode);
                      MyApp.setLocale(context, _locale);
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Text(e.name)
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => SignupActivity());
                    },
                    child: Text(
                      translation(context).skip,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: ColorsRes.secondaryColor),
                    ),
                  ),
                )
              ],
            )),

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
                            translation(context).belongToTeam,
                            style: TextStyle(),
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
                        child: Text(translation(context).earnPoints,
                            style: TextStyle()),
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
              child: IntrinsicHeight(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => LoginActivity(
                        backButtonEnabled: true,
                      ),
                    ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.9,
                    padding: EdgeInsets.only(top: 13, bottom: 13),
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
                      translation(context).signIn,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// sign up section
            RichText(
                text: TextSpan(
                    style: new TextStyle(color: ColorsRes.secondaryColor),
                    text: translation(context).dontHaveAccount + " ",
                    children: <TextSpan>[
                  TextSpan(
                      text: translation(context).signUp,
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
    );
  }
}
