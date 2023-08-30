import 'dart:math';

import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/pages/mobile/login_page.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gqfl;

class ClientController extends GetxController {
  late var box;
  late var store;
  late Cache cache;
  String token = "";
  RxBool switchCar = RxBool(false);
  Cache clientCache = Cache();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void onInit() {
    checkToken();
    getToken();
    super.onInit();
  }

  var client = Client(
    link: HttpLink(Constant.mainUrl,
        defaultHeaders: {"Authorization": "Bearer "}),
  );

  var wsClient = Client(
    link: WebSocketLink(Constant.webSocketUrl),
  );

  void getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token =
        (_prefs.getString('token') != null ? _prefs.getString('token') : "")!;
    client = Client(
        link: HttpLink(Constant.mainUrl,
            defaultHeaders: {"Authorization": "Bearer $token"}));
  }

  final String callBackUrl = Constant.callbackUrl;

  Future<void> initialize(String accessToken) async {
    box = await Hive.openBox("graphql");
    store = HiveStore(box);
    cache = Cache(store: store);
    client = Client(
      link: HttpLink(
        Constant.mainUrl,
        defaultHeaders: {
          "Authorization": "Bearer $accessToken",
        },
      ),
      cache: cache,
    );
  }

  void clearCache() {
    cache.clear();
    update();
  }

  updateToken(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    client = Client(
      link: HttpLink(Constant.mainUrl, defaultHeaders: {
        "Authorization": "Bearer $token",
      }),
    );

    _prefs.setString(
        'tokenExpiryDate', DateTime.now().add(Duration(hours: 1)).toString());
  }

  Future<void> checkToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var tokenExpiryDate = (_prefs.getString('tokenExpiryDate') != null
        ? _prefs.getString('tokenExpiryDate')
        : "")!;
    DateTime expiryDate;

    if (tokenExpiryDate != "") {
      expiryDate = DateTime.parse(tokenExpiryDate);
    } else {
      expiryDate = DateTime.now().add(Duration(microseconds: -5));
    }

    if (expiryDate.isAfter(DateTime.now())) {
      // token is valid
      return;
    }

    var refreshToken = _prefs.getString('refreshToken');
    var token = _prefs.getString('token');

    final gqfl.GraphQLClient client = gqfl.GraphQLClient(
      cache: gqfl.GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String query = '''
      mutation  {	accessToken(
		model: {
			refreshToken: "$refreshToken"
			token: "$token"
		}
	) {
		data {
			token
			userName
		}
	}
}
  ''';

    final gqfl.MutationOptions options = gqfl.MutationOptions(
      document: gqfl.gql(query),
    );

    final gqfl.QueryResult result = await client.mutate(options);
    if (result.hasException) {
      analytics.logEvent(
          name: 'token_refresh_error',
          parameters: {'error': result.exception.toString()});
      return;
    } else {
      var token = result.data!['accessToken']['data']['token'];
      _prefs.setString('token', token);
      updateToken(token);
    }
  }
}

Future<void> checkLoggedDuration() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  AccountController accountController = Get.find<AccountController>();
  var lastLoggedOutTimeStr = (_prefs.getString('lastLoggedOutTimeStr') != null
      ? _prefs.getString('lastLoggedOutTimeStr')
      : "")!;
  DateTime nextLogOutTime;

  if (lastLoggedOutTimeStr != "") {
    nextLogOutTime = DateTime.parse(lastLoggedOutTimeStr);
  } else {
    nextLogOutTime = DateTime.now().add(Duration(microseconds: -5));
  }

  if (nextLogOutTime.isAfter(DateTime.now())) {
    // still logged in
    return;
  } else {
    accountController.isLoggedIn = false.obs;

    final preferences = await SharedPreferences.getInstance();

    await preferences.remove('aboutMe');
    await preferences.remove('phone');
    await preferences.remove('accountId');
    await preferences.remove('email');
    await preferences.remove('username');
    await preferences.remove('profileImageName');
    await preferences.remove('cAbbrev');
    await preferences
        .remove('token')
        .whenComplete(() => Get.off(() => LoginActivity(
              backButtonEnabled: true,
            )));
  }
}
