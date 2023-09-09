import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart'; 
import 'home_page.dart';

class AddProfilePage extends StatefulWidget {
  final bool isDriver;

  const AddProfilePage({Key? key, required this.isDriver}) : super(key: key);

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  TextEditingController licenceNumber = TextEditingController();
  GlobalKey<ScaffoldState>? scaffoldKey;
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  bool isupLoadingImage = false;
  bool isProfileUploaded = false;
  String user = '', email = '', imageName = '';

  @override
  void initState() {
    super.initState();
    getPrefs();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  void stopLoadingCallBack() {
    setState(() {
      isupLoadingImage = false;
      isProfileUploaded = true;
      getPrefs();
    });
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = _prefs.getString("username")!;
      email = _prefs.getString("email")!;
      imageName = _prefs.getString("profileImageName")!;
      _accountController.imageName = _prefs.getString("profileImageName")!.obs;
    });

    analytics.setCurrentScreen(screenName: "Add Profile Page Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        key: scaffoldKey,
        backgroundColor: ColorsRes.backgroundColor,
        body: WillPopScope(
          onWillPop: _backPress,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
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
                  Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /// verification text
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Upload Profile Image",
                          style:
                              Theme.of(context).textTheme.headlineMedium!.merge(
                                    TextStyle(
                                        color: ColorsRes.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isupLoadingImage = true;
                          });
                          pickUpdateUserImage(
                              _accountController, user, stopLoadingCallBack);
                          analytics.logEvent(
                              name: 'add_profile_page_upload_image',
                              parameters: null);
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.only(bottom: 17),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: Colors.white)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Stack(
                              children: [
                                isupLoadingImage
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ),
                                      )
                                    : Positioned.fill(
                                        child: Image.network(
                                        getProfileImageUrl(imageName),
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.grey,
                                            size: 40,
                                          );
                                        },
                                      )),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: Colors.blueGrey,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Username: ${user}",
                        style:
                            Theme.of(context).textTheme.headlineMedium!.merge(
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Email: ${email}",
                        style:
                            Theme.of(context).textTheme.headlineMedium!.merge(
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                      ),
                      SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Note: For security purposes, you are required to upload your profile photo. This is meant to help drivers or passengers know who they would be travelling with.",
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.headlineMedium!.merge(
                                    TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 50),
                        child: ButtonClickAnimation(
                          onTap: () {
                            if (isProfileUploaded) {
                              Get.to(HomePage());
                            } else {
                              Get.snackbar('You can\'t proceed.',
                                  'Please upload a profile picture');
                            }
                          },
                          child: IntrinsicHeight(
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: EdgeInsets.only(top: 13, bottom: 13),
                              alignment: Alignment.center,
                              decoration: DesignConfig.buttonShadowColor(
                                  isProfileUploaded
                                      ? ColorsRes.green
                                      : Colors.grey,
                                  37,
                                  isProfileUploaded
                                      ? ColorsRes.green
                                      : Colors.grey),
                              child: Text(
                                "Complete",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorsRes.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // upload later?
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 50),
                          child: ButtonClickAnimation(
                            onTap: () {
                              Get.to(HomePage());
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding: EdgeInsets.only(top: 13, bottom: 13),
                                alignment: Alignment.center,
                                decoration: DesignConfig.buttonShadowColor(
                                    ColorsRes.continueShoppingGradient1Color,
                                    37,
                                    ColorsRes.continueShoppingGradient2Color),
                                child: Text(
                                  "Upload later?",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ));
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

  void getUserId(String userName) async {
    final getUserIdReq =
        GGetUserWithFilterReq((b) => b..vars.userName = userName);
    _clientController.client.request(getUserIdReq).listen((event) {
      if (event.data!.users.first.id!.isNotEmpty) {
        _accountController.accountId = event.data!.users.first.id.obs;
        Get.off(() => HomePage());
      }
    });
  }
}
