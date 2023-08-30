import 'package:flutter/cupertino.dart';
import 'package:pamride/controllers/controllers.dart';
import 'package:pamride/routing/router.dart';
import 'package:pamride/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: rideSearchPageRoute,
    );
