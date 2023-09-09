import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/widgets/images.dart';
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
  var currentPage = ProfileSections.dashboard;

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
                              ? translation(context).accountSettings
                              : translation(context).accountSettings,
                          style: TextStyle(fontSize: 20),
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
                    ProfileSection(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 80,
                    width: 80,
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
                //   Row(
                //     children: [
                //       Padding(
                //           padding: const EdgeInsetsDirectional.only(start: 10),
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Obx(() {
                //                 return Text(
                //                   'Hi, John Doe ${_accountController.userName.toString()}',
                //                   style: Theme.of(context).textTheme.titleMedium!,
                //                 );
                //               }),
                //               Obx(() {
                //                 return Text(
                //                   "johndoe@wonderfulemail.com${_accountController.email.toString()}",
                //                   style: Theme.of(context).textTheme.titleSmall!,
                //                 );
                //               }),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         'Loyalty Points',
                //                         style: TextStyle(
                //                             fontSize: 14.0,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                       Text(loyaltyPoints),
                //                     ],
                //                   ),
                //                   IconButton(
                //                     icon: Icon(
                //                       Icons.info,
                //                     ),
                //                     onPressed: () {
                //                       // Show a dialog with loyalty points explanation
                //                       showDialog(
                //                         context: context,
                //                         builder: (BuildContext context) {
                //                           return AlertDialog(
                //                             title: Text('Loyalty Points'),
                //                             content: Column(
                //                               mainAxisSize: MainAxisSize.min,
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text('Earn loyalty points by:'),
                //                                 SizedBox(height: 8.0),
                //                                 Text(
                //                                     '- Sharing the app (10 pts/invite)'),
                //                                 Text(
                //                                     '- Scanning tickets (5 pts/ride)'),
                //                                 SizedBox(height: 16.0),
                //                                 Text('Losing loyalty points:'),
                //                                 SizedBox(height: 8.0),
                //                                 Text(
                //                                     '- Rating the app negatively (5 pts/ride)'),
                //                                 SizedBox(height: 16.0),
                //                                 Text(
                //                                     '1 Loyalty Point equals 0.5 usd , \nLoyalty points can be redeemed to pay for tickets and checks.'),
                //                               ],
                //                             ),
                //                             actions: [
                //                               TextButton(
                //                                 onPressed: () {
                //                                   Navigator.of(context).pop();
                //                                 },
                //                                 child: Text('OK'),
                //                               ),
                //                             ],
                //                           );
                //                         },
                //                       );
                //                     },
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           )),
                //     ],
                //   ),
                //
              ],
            ),
          ],
        ));
  }

  Widget ProfileSection() {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(5, "Highness Name", Icons.settings_outlined,
              currentPage == ProfileSections.settings ? true : false),
          menuItem(6, "Last Name", Icons.notifications_outlined,
              currentPage == ProfileSections.notifications ? true : false),
          // menuItem(5, "Phone number", Icons.settings_outlined,
          //     currentPage == ProfileSections.settings ? true : false),
          // menuItem(6, "Email", Icons.notifications_outlined,
          //     currentPage == ProfileSections.notifications ? true : false),
          // menuItem(5, "Gender", Icons.settings_outlined,
          //     currentPage == ProfileSections.settings ? true : false),
          // menuItem(6, "Birthday", Icons.notifications_outlined,
          //     currentPage == ProfileSections.notifications ? true : false),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: true,
                activeColor: ColorsRes.secondaryColor,
                onChanged: (value) => {},
              ),
              menuItem(7, translation(context).emailNotifications, null,
                  currentPage == ProfileSections.privacy_policy ? true : false),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: false,
                activeColor: ColorsRes.secondaryColor,
                onChanged: (value) => {},
              ),
              menuItem(8, translation(context).textNotifications, null,
                  currentPage == ProfileSections.send_feedback ? true : false),
            ],
          ),
          menuItem(9, translation(context).changePassword, Icons.arrow_back,
              currentPage == ProfileSections.settings ? true : false),
          menuItem(
              10,
              translation(context).privacyPolicy,
              Icons.arrow_back_outlined,
              currentPage == ProfileSections.notifications ? true : false),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_sharp),
              Row(
                children: [
                  Text(
                    translation(context).logOut,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData? icon, bool selected) {
    return Material(
      color: selected ? ColorsRes.secondaryColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = ProfileSections.dashboard;
            } else if (id == 2) {
              currentPage = ProfileSections.contacts;
            } else if (id == 3) {
              currentPage = ProfileSections.events;
            } else if (id == 4) {
              currentPage = ProfileSections.notes;
            } else if (id == 5) {
              currentPage = ProfileSections.settings;
            } else if (id == 6) {
              currentPage = ProfileSections.notifications;
            } else if (id == 7) {
              currentPage = ProfileSections.privacy_policy;
            } else if (id == 8) {
              currentPage = ProfileSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ProfileSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
