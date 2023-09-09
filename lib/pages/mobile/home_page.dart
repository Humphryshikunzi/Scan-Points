import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/pages/mobile/landing_page.dart';
import 'package:pamride/pages/mobile/profile_page.dart'; 
import 'package:pamride/widgets/search_offers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'scan_page.dart';
import 'message_page.dart';
import 'package:pamride/helpers/Language_Constants.dart';

class HomePage extends StatefulWidget {
  final bool resetIndex;
  final int? activePage;
  const HomePage({Key? key, this.resetIndex = false, this.activePage})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AccountController _accountController = Get.find();
  ClientController _clientController = Get.find<ClientController>();
  int tabValue = 0;
  List<Widget> passengerPages = [
    LandingPage(),
    SearchOffers(),
    QRScannerScreen(),
    MessageActivity(),
    ProfilePage(),
  ];

  @override
  void initState() {
    if (widget.resetIndex) {
      setState(() {
        tabValue = 0;
      });
    }
    checkAuthStatus();
    tabValue = widget.activePage ?? 0;
    super.initState();
  }

  checkAuthStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('email') != null &&
        _prefs.getString('phone') != null &&
        _prefs.getString('accountId') != null &&
        _prefs.getString('username') != null) {
      _accountController.isLoggedIn = true.obs;
      _accountController.phoneNumber = _prefs.getString('phone').obs;
      _accountController.accountId = _prefs.getString('accountId').obs;
      _accountController.email = _prefs.getString('email').obs;
      _accountController.userName = _prefs.getString('username').obs;

      var accessToken = _prefs.getString('token')!;
      _clientController.initialize(accessToken);
    } else {
      _accountController.isLoggedIn = false.obs;
    }
    if (_prefs.getString('profileImageName') != null) {
      _accountController.profileImage =
          _prefs.getString('profileImageName').obs;
    }
    _accountController.fetchToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: passengerPages[tabValue],
      bottomNavigationBar: tabBar(),
    );
  }

  Widget tabBar() {
    return kIsWeb
        ? SizedBox.shrink()
        : CupertinoTabBar(
            activeColor: ColorsRes.secondaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: translation(context).home,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/logo.png'),
                ),
                label: translation(context).search,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.square_list,
                ),
                label: translation(context).scan,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.shopping_cart,
                ),
                label: translation(context).stores,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                ),
                label: translation(context).myAccount,
              ),
            ],
            currentIndex: tabValue,
            onTap: (value) {
              setState(
                () {
                  tabValue = value;
                },
              );
            },
          );
  }
}
