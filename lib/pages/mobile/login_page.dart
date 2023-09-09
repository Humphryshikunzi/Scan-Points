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
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/pages/mobile/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';
import 'home_page.dart';
import 'package:pamride/helpers/Language_Constants.dart';

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
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
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

    Color inputBackgroundColor =
        Theme.of(context).brightness == Brightness.light
            ? Colors.white // Light mode background color
            : Colors.black; // Dark mode background color

    Color borderColor = Theme.of(context).brightness == Brightness.light
        ? ColorsRes.secondaryColor // Light mode background color
        : ColorsRes.grayColor; // Dark mode background color

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: Container(
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
                  child: Center(
                    child: Image.asset(
                      isDarkMode
                          ? "assets/images/logo.png"
                          : "assets/images/logo_light.jpeg",
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.56,
                  width: MediaQuery.of(context).size.height * 0.9,
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
                            translation(context).appName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .merge(
                                  TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(translation(context).signIn,
                            style: Theme.of(context).textTheme.titleLarge!),
                        SizedBox(height: 15),

                        // /// email textfield
                        // Container(
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        //   width: MediaQuery.of(context).size.height * 0.9,
                        //   decoration: DesignConfig.boxDecorationContainerShadow(
                        //       ColorsRes.containerShadowColor, 10, 10, 10, 10),
                        //   margin: EdgeInsets.only(top: 7),
                        //   padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //       hintText: translation(context).usernameOrEmail,
                        //       hintStyle: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.normal,
                        //           color: ColorsRes.grayColor.withOpacity(0.5)),
                        //       border: InputBorder.none,
                        //     ),
                        //     keyboardType: TextInputType.emailAddress,
                        //     controller: edtemail,
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.9,
                          decoration: BoxDecoration(
                            color:
                                inputBackgroundColor, // Use the determined color here
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 7),
                          padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: translation(context).usernameOrEmail,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: edtemail,
                          ),
                        ),
                        SizedBox(height: 20),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.9,
                          decoration: BoxDecoration(
                            color:
                                inputBackgroundColor, // Use the determined color here
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 7),
                          padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: edtpsw,
                            decoration: InputDecoration(
                              hintText: translation(context).passwordHint,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5),
                              ),
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
                              translation(context).forgotPassword,
                              style: TextStyle(color: ColorsRes.secondaryColor),
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
                                            builder: (context) => HomePage()));
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        padding: EdgeInsets.only(
                                            top: 13, bottom: 13),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: ColorsRes.secondaryColor,
                                          borderRadius: BorderRadius.circular(
                                              10), // Set the corner radius here
                                          boxShadow: [
                                            BoxShadow(
                                                // Shadow properties...
                                                ),
                                          ],
                                        ),
                                        child: Text(
                                          translation(context).signIn,
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
                                text:
                                    translation(context).dontHaveAccount + " ",
                                style:
                                    TextStyle(color: ColorsRes.secondaryColor),
                                children: <TextSpan>[
                              TextSpan(
                                  text: translation(context).signUp,
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
    );
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
