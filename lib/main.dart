import 'dart:async';
import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pamride/components/messages/preferences.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/controllers/rides_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/helpers/client.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/pre_sign_up.dart';
import 'package:pamride/provider/theme_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'components/constant.dart';
import 'controllers/account_controller.dart';
import 'controllers/navigation_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  Get.lazyPut(() => ClientController());
  Get.put(MessagePreference());
  Get.put(NavigationController());
  Get.put(RidesController());

  AccountController _accountController = Get.put(AccountController());

  await Hive.initFlutter();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // messaging.setForegroundNotificationPresentationOptions(
  //   alert: true, badge: true, sound: true);

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    // do something
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
    // do something
  } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print('user declined notifications');
    // user does not like you! can't ask for permissions again
  } else {
    print('User has not accepted permission');
    // do something

    print('notification status is');
    print('About to ask for permission');
    await Permission.notification.request();
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // foreground listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received message: ${message.notification?.title}');

    Get.snackbar(
        "${message.notification!.title}", "${message.notification!.body}",
        snackPosition: SnackPosition.TOP);

    // do something with the message here
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('User tapped on notification: ${message.notification?.title}');
    // do something with the message
  });

  runApp(
    GraphQLProvider(
      client: Config.initailizeClient(),
      child: MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
  // print('got a new bg message');
  // do something with the message
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          ClientController _clientController = Get.find<ClientController>();
          AccountController _accountController = Get.find<AccountController>();

          //_clientController.initialize();
          final themeProvider = Provider.of<ThemeProvider>(context);

          return GetMaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: FutureBuilder<dynamic>(
                future: _accountController.fetchToken(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  // Checking if future is resolved
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorsRes.appcolor_material,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return UpgradeAlert(
                      upgrader:
                          Upgrader(dialogStyle: UpgradeDialogStyle.material),
                      child: PreSignUpPage(
                        backButtonEnabled: false,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    var data = snapshot.data;

                    if (data != false) {
                      return UpgradeAlert(
                        upgrader:
                            Upgrader(dialogStyle: UpgradeDialogStyle.material),
                        child: HomePage(),
                      );
                    } else {
                      return UpgradeAlert(
                        upgrader:
                            Upgrader(dialogStyle: UpgradeDialogStyle.material),
                        child: PreSignUpPage(
                          backButtonEnabled: false,
                        ),
                      );
                    }
                  }
                  return UpgradeAlert(
                    upgrader:
                        Upgrader(dialogStyle: UpgradeDialogStyle.material),
                    child: PreSignUpPage(
                      backButtonEnabled: false,
                    ),
                  );
                }),
            //MyHomePage(),
            debugShowCheckedModeBanner: false,
            locale: _locale,
            title: "Entema",
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeProvider.themeMode,
          );
        },
      );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Container(
          child: Column(children: [
            FlutterLogo(size: MediaQuery.of(context).size.height * 0.75),
            Text(
              "Scan Points, ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              "Get Rewards",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )
          ]),
        ));
  }
}
