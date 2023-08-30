import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/pages/mobile/edit_profile_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/social_media_buttons.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  String profileExtension = ".jpg";
  String user = 'Guest', email = '', imageName = '';
  bool isupLoadingImage = false;
  String loyaltyPoints = "0.0";
  String referalCode = "";

  @override
  void initState() {
    GetMoreOfMyData();
    getPrefs();
    super.initState();
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = _prefs.getString("username")!;
      email = _prefs.getString("email")!;
      imageName = _accountController.profileImage.toString();
    });
    analytics.setCurrentScreen(screenName: "Profile Page");
  }

  void stopLoadingCallBack() {
    setState(() {
      isupLoadingImage = false;
      getPrefs();
    });
  }

  Future<void> GetMoreOfMyData() async {
    final getUserIdReq = GGetUserWithFilterReq(
        (b) => b..vars.userName = _accountController.userName.value);
    _clientController.client.request(getUserIdReq).listen((event) {
      if (event.data!.users.first.id!.isNotEmpty) {
        if (mounted) {
          setState(() {
            loyaltyPoints = event.data!.users.first.loyaltyPoints.toString();
            referalCode = event.data!.users.first.referalCode.toString();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsRes.backgroundColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Row(children: [
                        Text(
                          _accountController.isDriver.value
                              ? 'Account Settings'
                              : 'Account Settings',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ]);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [logOut(_accountController, context)],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _getHeader(),
                    Divider(),
                    missionVision(),
                    termsAndConditions(),
                    rateAppOnPlayStore(),
                    shareApp(context, referalCode),
                    support(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Entema for Android, v1.0.1, (${DateTime.now().year})',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
          bottom: 0.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isupLoadingImage = true;
                        });
                        pickUpdateUserImage(
                            _accountController, user, stopLoadingCallBack);
                      },
                      child: Container(
                        margin: EdgeInsetsDirectional.only(bottom: 17),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0, color: white)),
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
                                      child: CachedNetworkImage(
                                        imageUrl: getProfileImageUrl(imageName),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: Colors.blueGrey,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Get.to(EditProfilePage());
                      },
                      child: Container(
                        width: 50,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        alignment: Alignment.center,
                        decoration: DesignConfig.buttonShadowColor(
                                ColorsRes.secondaryColor,
                                37,
                                ColorsRes.secondaryColor)
                            .copyWith(borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsRes.white,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsetsDirectional.only(start: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return Text(
                                'Hi, John Doe ${_accountController.userName.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: fontColor),
                              );
                            }),
                            Obx(() {
                              return Text(
                                "johndoe@wonderfulemail.com${_accountController.email.toString()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: fontColor),
                              );
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Loyalty Points',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(loyaltyPoints),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.info,
                                  ),
                                  onPressed: () {
                                    // Show a dialog with loyalty points explanation
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Loyalty Points'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Earn loyalty points by:'),
                                              SizedBox(height: 8.0),
                                              Text(
                                                  '- Sharing the app (10 pts/invite)'),
                                              Text(
                                                  '- Scanning tickets (5 pts/ride)'),
                                              SizedBox(height: 16.0),
                                              Text('Losing loyalty points:'),
                                              SizedBox(height: 8.0),
                                              Text(
                                                  '- Rating the app negatively (5 pts/ride)'),
                                              SizedBox(height: 16.0),
                                              Text(
                                                  '1 Loyalty Point equals 0.5 usd , \nLoyalty points can be redeemed to pay for tickets and checks.'),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
