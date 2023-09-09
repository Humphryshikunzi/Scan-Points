import 'package:flutter/material.dart';
import 'package:pamride/pages/mobile/scan_page.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/message_page.dart';
import 'package:pamride/pages/mobile/profile_page.dart';
import 'package:pamride/routing/routes.dart';
import 'package:pamride/widgets/search_offers.dart';
import '../site_layout.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
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
      return _getPageRoute(SearchOffers());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
