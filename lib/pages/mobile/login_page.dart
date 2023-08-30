import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/controllers/preference_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/StringsRes.dart';
import 'package:pamride/pages/mobile/driver_home.dart';
import 'package:pamride/pages/mobile/pre_signup_page.dart';
import 'package:pamride/pages/mobile/reset_password_request.dart';
import 'package:pamride/pages/mobile/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';
import 'home_page.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class LoginActivity extends StatefulWidget {
  final bool backButtonEnabled;

  const LoginActivity({Key? key, required this.backButtonEnabled})
      : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  bool _obscureText = true;
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  List<Map<String, dynamic>> rolesList = [];
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  String loginUserMutation = """
  mutation UserLogin(\$email: String!, \$password: String!){
    login (request:{email:\$email, password: \$password}){
        succeeded,
        data{
            refreshTokenExpiryTime, refreshToken, token, userName, userImageURL
        }
        messages
    }
}
  """;

  final HttpLink httpLink = HttpLink(
    Constant.mainUrl,
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ',
  );

  @override
  void initState() {
    getAllRoles();
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    analytics.setCurrentScreen(screenName: "Login");
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  void initializeHive() async {
    await initHiveForFlutter();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsRes.black,
      body: WillPopScope(
        onWillPop: _backPress,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: ColorsRes.blackTransparentColor),
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    width: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          /// Login text
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Entema",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .merge(
                                    TextStyle(
                                        color: ColorsRes.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Sign in",
                            style:
                                Theme.of(context).textTheme.displaySmall!.merge(
                                      TextStyle(
                                          color: ColorsRes.secondaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Welcome, Sign in with Entema",
                            style:
                                Theme.of(context).textTheme.displaySmall!.merge(
                                      TextStyle(
                                          color: ColorsRes.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                          ),
                          SizedBox(height: 25),

                          /// email textfield
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.height * 0.9,
                            decoration:
                                DesignConfig.boxDecorationContainerShadow(
                                    ColorsRes.containerShadowColor,
                                    10,
                                    10,
                                    10,
                                    10),
                            margin: EdgeInsets.only(top: 7),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(
                                  color: ColorsRes.black, fontSize: 16),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                hintText: "username or email",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color:
                                        ColorsRes.grayColor.withOpacity(0.5)),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: edtemail,
                            ),
                          ),
                          SizedBox(height: 20),

                          /// password textfield
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.height * 0.9,
                            decoration:
                                DesignConfig.boxDecorationContainerShadow(
                                    ColorsRes.containerShadowColor,
                                    10,
                                    10,
                                    10,
                                    10),
                            margin: EdgeInsets.only(top: 7),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: edtpsw,
                              style: TextStyle(
                                  color: ColorsRes.black, fontSize: 16),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                hintText: "password",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color:
                                        ColorsRes.grayColor.withOpacity(0.5)),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ColorsRes.grayColor,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          /// forgot password text
                          Container(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => HomePage());
                              },
                              child: Text(
                                StringsRes.forgotpassword,
                                style:
                                    TextStyle(color: ColorsRes.secondaryColor),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          /// the Login button
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 25),
                            child: GraphQLProvider(
                              client: client,
                              child: Mutation(
                                  options: MutationOptions(
                                    document: gql(
                                        loginUserMutation), // this is the mutation string you just created
                                    // or do something with the result.data on completion
                                    onCompleted: (dynamic resultData) {
                                      Navigator.of(context).pushReplacement(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                    update: (cache, result) {
                                      debugPrint(result.toString());
                                      SVProgressHUD.dismiss();
                                      return cache;
                                    },
                                  ),
                                  builder: (runMutation, result) {
                                    return IntrinsicHeight(
                                      child: InkWell(
                                        onTap: () {
                                          if (edtemail.text.isEmpty ||
                                              edtpsw.text.isEmpty) {
                                            Get.snackbar('Error',
                                                'Fill all required fields and try again');
                                          } else {
                                            SVProgressHUD.show(
                                                status: "Logging in...");
                                            runMutation({
                                              'email': edtemail.text,
                                              'password': edtpsw.text,
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          padding: EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          alignment: Alignment.center,
                                          decoration:
                                              DesignConfig.buttonShadowColor(
                                                  ColorsRes.secondaryColor,
                                                  37,
                                                  ColorsRes.secondaryColor),
                                          child: Text(
                                            "Sign in",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: ColorsRes.white,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Poppins"),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),

                          /// sign up section
                          RichText(
                              text: TextSpan(
                                  style: new TextStyle(color: ColorsRes.white),
                                  text: "Don't have an account? ",
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Sign up now",
                                    style: TextStyle(
                                        color: ColorsRes.secondaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => SignupActivity());
                                      }),
                              ])),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> getAllRoles() async {
    final getAllRolesReq = GGetAllRolesReq();
    _clientController.client.request(getAllRolesReq).listen((event) {
      if (event.data!.roles.data.isNotEmpty) {
        for (int i = 0; i < event.data!.roles.data.length; i++) {
          rolesList.add({
            "name": event.data!.roles.data[i].name,
            "id": event.data!.roles.data[i].id,
          });
        }
        debugPrint("Roles List: $rolesList");
      }
    });
    if (rolesList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void checkIfUserIsDriver({required String userId}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (rolesList.isEmpty) {
      getAllRoles().whenComplete(() => checkIfUserIsDriver(userId: userId));
    } else {
      final checkIfUserIsDriverReq = GCheckIfUserIsDriverReq((b) => b
        ..vars.userId = userId
        ..vars.driverRoleId = rolesList
            .where((element) => element['name'] == 'Driver')
            .first['id']);
      _clientController.client.request(checkIfUserIsDriverReq).listen((event) {
        SVProgressHUD.dismiss();
        if (event.data!.usersInRole.isNotEmpty) {
          _prefs.setBool("isLoggedInUserADriver", true);
          _accountController.isUserLoggedInADriver = true.obs;
        } else {
          _prefs.setBool("isLoggedInUserADriver", false);
          _accountController.isUserLoggedInADriver = false.obs;
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => HomePage()));
        }
      });
    }
  }

  Future<void> updateFCMToken(String userId) async {
    String? deviceRegToken = await FirebaseMessaging.instance.getToken();
    final updateFCMTokenReq = GupdateFMCTokenReq((b) => b
      ..vars.userId = userId
      ..vars.fcmToken = deviceRegToken);
    _clientController.client.request(updateFCMTokenReq).listen(
      (event) {
        // do something for sucess or failure
        if (event.data?.updateFMCToken.succeeded == true) {
          debugPrint("FCM Token updated successfully");
        } else {
          debugPrint("FCM Token update failed");
        }
      },
    );
  }

  updateUserPrefs(String userName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("username", userName);
  }
}
