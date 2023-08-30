import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'signup_page.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class PreSignupPage extends StatefulWidget {
  final bool backButtonEnabled;

  const PreSignupPage({Key? key, required this.backButtonEnabled})
      : super(key: key);

  @override
  _PreSignupPageState createState() => _PreSignupPageState();
}

class _PreSignupPageState extends State<PreSignupPage> {
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,
      body: WillPopScope(
        onWillPop: _backPress,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Align(
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
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                Text(
                  'Click one of the buttons below to\nsign up as a driver or a\npassenger',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.merge(
                      TextStyle(
                          color: ColorsRes.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Text(
                  "You can always change this later",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child:
                        SvgPicture.asset('assets/assets/choose_account.svg')),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignupActivity());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.9,
                    padding: EdgeInsets.only(top: 13, bottom: 13),
                    alignment: Alignment.center,
                    decoration: DesignConfig.buttonShadowColor(
                        ColorsRes.gradientTwoColor,
                        37,
                        ColorsRes.gradientOneColor),
                    child: Text(
                      'Passenger',
                      style: TextStyle(
                          fontSize: 17,
                          color: ColorsRes.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignupActivity());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.9,
                    padding: EdgeInsets.only(top: 13, bottom: 13),
                    //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    alignment: Alignment.center,
                    decoration: DesignConfig.buttonShadowColor(
                        Colors.green, 37, Colors.greenAccent),
                    child: Text(
                      'Driver',
                      style: TextStyle(
                          fontSize: 17,
                          color: ColorsRes.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
