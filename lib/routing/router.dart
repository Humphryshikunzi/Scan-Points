import 'package:flutter/material.dart';
import 'package:pamride/pages/mobile/driver_home.dart';
import 'package:pamride/pages/mobile/scan_page.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/message_page.dart';
import 'package:pamride/pages/mobile/profile_page.dart';
import 'package:pamride/pages/mobile/ride_search_page.dart';
import 'package:pamride/routing/routes.dart';
import '../site_layout.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case postRidePageRoute:
      return _getPageRoute(PostRidePage());
    case historyPageRoute:
      return _getPageRoute(QRScannerScreen());
    case messageActivityRoute:
      return _getPageRoute(MessageActivity());
    case profilePageRoute:
      return _getPageRoute(ProfilePage());
    case homePageRoute:
      return _getPageRoute(HomePage());
    case siteLayoutRoute:
      return _getPageRoute(SiteLayout());
    default:
      return _getPageRoute(RideSearchPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
