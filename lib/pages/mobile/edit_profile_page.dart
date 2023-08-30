import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/pages/mobile/login_page.dart';
import 'package:pamride/pages/mobile/reset_password_request.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';
import '../../helpers/StringsRes.dart';
import 'home_page.dart';
import 'package:graphql/client.dart';

class EditProfilePage extends StatefulWidget {
  final String? from;

  const EditProfilePage({
    Key? key,
    this.from,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  TextEditingController licenceNumber = TextEditingController();
  TextEditingController edtfirstname = TextEditingController();
  TextEditingController edtlastname = TextEditingController();
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  TextEditingController edtId = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  TextEditingController edtUserName = TextEditingController();
  TextEditingController edtAboutMe = TextEditingController();

  bool isupLoadingImage = false;
  bool isProfileUploaded = false;
  String imageName = '';

  @override
  void initState() {
    super.initState();
    getPrefs();
    scaffoldKey = GlobalKey<ScaffoldState>();
    analytics.setCurrentScreen(screenName: "Edit Profile");
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  void stopLoadingCallBack() {
    setState(() {
      isupLoadingImage = false;
      getPrefs();
    });
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      edtUserName.text = _prefs.getString("username")!;
      edtemail.text = _prefs.getString("email")!;
      edtphone.text = _prefs.getString("phone")!;
      edtfirstname.text = _accountController.firstName.value;
      edtlastname.text = _accountController.lastName.value;
      var profileImage = _prefs.getString("profileImageName")!.obs;
      imageName = profileImage.obs.toString();
      edtAboutMe.text = _prefs.getString('aboutMe')!;
      if (edtAboutMe.text == 'null') {
        edtAboutMe.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBody: true,
        backgroundColor: ColorsRes.white,
        body: WillPopScope(
          onWillPop: _backPress,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 15,
                        left: 15,
                        right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          shape: DesignConfig.setRoundedBorder(
                              ColorsRes.white, 8, false),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /// verification text
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Edit Your Profile",
                          style:
                              Theme.of(context).textTheme.headlineMedium!.merge(
                                    TextStyle(
                                        color: ColorsRes.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isupLoadingImage = true;
                          });
                          pickUpdateUserImage(_accountController,
                              edtUserName.text, stopLoadingCallBack);
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.only(bottom: 7),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: Colors.white)),
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
                                          imageUrl:
                                              getProfileImageUrl(imageName),
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
                                    Icons.add_photo_alternate_outlined,
                                    color: Colors.blueGrey,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      /// firstname/lastname container
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "First Name",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorsRes.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration:
                                      DesignConfig.boxDecorationContainerShadow(
                                              ColorsRes.containerShadowColor,
                                              10,
                                              10,
                                              10,
                                              10)
                                          .copyWith(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.3)),
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: ColorsRes.black, fontSize: 16),
                                    cursorColor: ColorsRes.black,
                                    decoration: InputDecoration(
                                      hintText: StringsRes.lblname,
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5)),
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.text,
                                    controller: edtfirstname,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Last Name",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorsRes.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration:
                                      DesignConfig.boxDecorationContainerShadow(
                                              ColorsRes.containerShadowColor,
                                              10,
                                              10,
                                              10,
                                              10)
                                          .copyWith(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.3)),
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: ColorsRes.black, fontSize: 16),
                                    cursorColor: ColorsRes.black,
                                    decoration: InputDecoration(
                                      hintText: StringsRes.lblname,
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsRes.grayColor
                                              .withOpacity(0.5)),
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.text,
                                    controller: edtlastname,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      /// email text
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: StringsRes.lblemail,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: ' (non-editable)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// email textfield
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: DesignConfig.boxDecorationContainerShadow(
                                ColorsRes.containerShadowColor, 10, 10, 10, 10)
                            .copyWith(color: Colors.white70)
                            .copyWith(
                                border: Border.all(
                                    color: Colors.black, width: 0.3)),
                        margin: EdgeInsets.only(top: 2),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          style:
                              TextStyle(color: ColorsRes.black, fontSize: 16),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            hintText: StringsRes.youremail,
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: edtemail,
                          readOnly: true,
                        ),
                      ),
                      SizedBox(height: 10),

                      /// mobile number text
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: StringsRes.lblmobileno,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: ' (non-editable)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// mobile number textfield
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: DesignConfig.boxDecorationContainerShadow(
                                ColorsRes.containerShadowColor, 10, 10, 10, 10)
                            .copyWith(color: Colors.white70)
                            .copyWith(
                                border: Border.all(
                                    color: Colors.black, width: 0.3)),
                        margin: EdgeInsets.only(top: 2),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          style:
                              TextStyle(color: ColorsRes.black, fontSize: 16),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            hintText: StringsRes.lblmobileno,
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          controller: edtphone,
                          readOnly: true,
                        ),
                      ),
                      SizedBox(height: 10),

                      /// username text
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),

                      /// username textfield
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: DesignConfig.boxDecorationContainerShadow(
                                ColorsRes.containerShadowColor, 10, 10, 10, 10)
                            .copyWith(
                                border: Border.all(
                                    color: Colors.black, width: 0.3)),
                        margin: EdgeInsets.only(top: 2),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          style:
                              TextStyle(color: ColorsRes.black, fontSize: 16),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            hintText: 'Enter a unique username',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: edtUserName,
                        ),
                      ),
                      SizedBox(height: 10),

                      /// about me text
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your Bio',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      /// about me textfield
                      /// username textfield
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: DesignConfig.boxDecorationContainerShadow(
                                ColorsRes.containerShadowColor, 10, 10, 10, 10)
                            .copyWith(
                                border: Border.all(
                                    color: Colors.black, width: 0.3)),
                        margin: EdgeInsets.only(top: 2),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          style:
                              TextStyle(color: ColorsRes.black, fontSize: 16),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            hintText: 'e.g. I like listening to drill music',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorsRes.grayColor.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          maxLines:
                              null, // or specify a desired number of lines
                          controller: edtAboutMe,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 10),
                        child: ButtonClickAnimation(
                          onTap: () {
                            updateUserDetails();
                          },
                          child: IntrinsicHeight(
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: EdgeInsets.only(top: 13, bottom: 13),
                              alignment: Alignment.center,
                              decoration: DesignConfig.buttonShadowColor(
                                  ColorsRes.continueShoppingGradient1Color,
                                  37,
                                  ColorsRes.continueShoppingGradient2Color),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorsRes.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("More Actions",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins")),
                  _changePassword(),
                  _deleteAccount(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsRes.black,
        textColor: ColorsRes.white,
        fontSize: 16.0);
  }

  void getUserId(String userName) async {
    final getUserIdReq =
        GGetUserWithFilterReq((b) => b..vars.userName = userName);
    _clientController.client.request(getUserIdReq).listen((event) {
      if (event.data!.users.first.id!.isNotEmpty) {
        _accountController.accountId = event.data!.users.first.id.obs;
        Get.off(() => HomePage());
      }
    });
  }

  void updateUserDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (edtUserName.text.isNotEmpty &&
        edtfirstname.text.isNotEmpty &&
        edtlastname.text.isNotEmpty) {
      SVProgressHUD.show(status: 'Updating...');
      final updateUserDetailsReq = GUpdateUserDetailsReq((b) => b
        ..vars.userName = edtUserName.text
        ..vars.firstName = edtfirstname.text
        ..vars.lastName = edtlastname.text
        ..vars.email = edtemail.text
        ..vars.aboutMe = edtAboutMe.text
        ..vars.phoneNumber = edtphone.text);
      _clientController.client.request(updateUserDetailsReq).listen((event) {
        if (event.data != null && event.data!.updateUser.succeeded) {
          SVProgressHUD.dismiss();
          _accountController.userName.value = edtUserName.text;
          _accountController.firstName.value = edtfirstname.text;
          _accountController.lastName.value = edtlastname.text;
          _accountController.phoneNumber.value = edtphone.text;

          _prefs.setString('username', edtUserName.text);
          _prefs.setString('aboutMe', edtAboutMe.text);
          _prefs.setString('phone', edtphone.text);

          Get.back();
        } else {
          SVProgressHUD.dismiss();
          Get.showSnackbar(
            GetSnackBar(
              title: 'Oops',
              message: 'An error occurred while updating your profile details',
              icon: Icon(
                Icons.info_outline,
                color: Colors.red,
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Notice',
          message: 'Check your information and try again.',
          icon: Icon(
            Icons.info_outline,
            color: Colors.red,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
    analytics.logEvent(name: 'update_profile', parameters: null);
  }

  _changePassword() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Change Password',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.password_rounded,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () async {
          analytics.logEvent(name: 'change_password', parameters: null);
          final box = context.findRenderObject() as RenderBox?;
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => ResetPasswordRequest()));
        },
      ),
    );
  }

  _deleteAccount() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Delete Account',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.delete_forever,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () async {
          AlertDialog alert = AlertDialog(
            title: Text("Delete Account?", style: TextStyle(color: Colors.red)),
            content: Text(
                "Are you sure you want to delete your account? \n\n There is no going back!"),
            actions: [
              TextButton(
                child: Text(
                  "No, Stay",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "Yes, Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  deleteUser();
                  analytics.logEvent(name: 'delete_account', parameters: null);
                },
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
      ),
    );
  }

  void deleteUser() async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String query = '''
       mutation {
  deleteUser(userName: "${_accountController.userName.value}") { 
    messages
  }
}

  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      accountOperationStatus("Account has not been deleted");
      return;
    } else {
      accountOperationStatus("Account has been successfully deleted");
      _accountController.isLoggedIn = false.obs;
      final preferences = await SharedPreferences.getInstance();
      await preferences.clear().whenComplete(() {
        Get.off(() => LoginActivity(
              backButtonEnabled: true,
            ));
      });
    }
  }

  // toast for successful addition of car
  void accountOperationStatus(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.orange,
        fontSize: 14.0);
  }
}
