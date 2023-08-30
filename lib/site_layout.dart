import 'package:flutter/material.dart';
import 'package:pamride/widgets/large_screen.dart';
import 'package:pamride/widgets/top_nav.dart';
import 'controllers/reponsiveness.dart';
import 'helpers/local_navigator.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: topNavigationBar(context, scaffoldKey),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: localNavigator(),
        ),
        mediumScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: localNavigator(),
        ),
        customScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: localNavigator(),
        ),
      ),
    );
  }
}
