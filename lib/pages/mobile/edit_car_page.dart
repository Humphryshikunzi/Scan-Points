import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/helpers/ButtonClickAnimation.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';
import '../../helpers/StringsRes.dart';
import 'home_page.dart';

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
  TextEditingController licenceNumber = TextEditingController();
  GlobalKey<ScaffoldState>? scaffoldKey;
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  TextEditingController edtfirstname = TextEditingController();
  TextEditingController edtlastname = TextEditingController();
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  TextEditingController edtId = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  TextEditingController edtUserName = TextEditingController();

  bool isupLoadingImage = false;
  bool isProfileUploaded = false;

  String user = 'Guest', email = '', imageName = '';

  @override
  void initState() {
    super.initState();
    getPrefs();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      edtUserName.text = _prefs.getString("username")!;
      edtemail.text = _prefs.getString("email")!;
      edtphone.text = _prefs.getString("phone")!;
      edtfirstname.text = _accountController.firstName.value;
      edtlastname.text = _accountController.lastName.value;
      imageName = _prefs.getString("profileImageName")!;
      _accountController.imageName = _prefs.getString("profileImageName")!.obs;
    });
  }

  updateImageUrl(String imageName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("profileImageName", imageName);
    _accountController.profileImage = imageName.obs;
  }

  /// function to select user image from local storage and save it to the server
  pickUpdateUserImage() async {
    if (await Permission.storage.request().isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if ((result.files.single.bytes ?? []).isEmpty) {
        } else {
          if (file.size > 10000000) {
            Get.snackbar("Error", "Maximum upload size is 10MB",
                snackPosition: SnackPosition.TOP);
          } else {
            setState(() {
              isupLoadingImage = true;
            });
            HttpHelper()
                .uploadFile(
                    file: File.fromUri(Uri.parse(result.files.single.path!)),
                    name: "${user.toUpperCase()}_PROFILE",
                    uploadType: "PROFILE",
                    extension: file.extension.toString(),
                    userId: _accountController.accountId.string,
                    onProgress: (int sentBytes, int totalBytes) {})
                .then(
              (value) {
                setState(() {
                  if (value['complete']) {
                    isProfileUploaded = true;
                    updateImageUrl(value["fileName"]);
                  } else {
                    Get.snackbar('Error',
                        'Oops, an error occurred while uploading your profile image. Please try again.');
                  }

                  isupLoadingImage = false;
                });
                setState(() {
                  imageName = value["fileName"];
                });
              },
            );
          }
        }
      } else {
        // User canceled the picker
      }
    } else {
      Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBody: true,
        backgroundColor: ColorsRes.backgroundColor,
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
                          pickUpdateUserImage();
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.only(bottom: 17),
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
                                        child: Image.network(
                                        '${Constant.profileImageUrl}${imageName}',
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.grey,
                                            size: 40,
                                          );
                                        },
                                      )),
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
                      SizedBox(height: 20),

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
                                          10),
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
                                          10),
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
                            .copyWith(color: Colors.white70),
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
                            ColorsRes.containerShadowColor, 10, 10, 10, 10),
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
                          keyboardType: TextInputType.name,
                          controller: edtUserName,
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
                      IgnorePointer(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: DesignConfig.boxDecorationContainerShadow(
                                  ColorsRes.containerShadowColor,
                                  10,
                                  10,
                                  10,
                                  10)
                              .copyWith(color: Colors.white70),
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
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 50),
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
        ..vars.email = edtemail.text);
      _clientController.client.request(updateUserDetailsReq).listen((event) {
        if (event.data != null && event.data!.updateUser.succeeded) {
          SVProgressHUD.dismiss();
          _accountController.userName.value = edtUserName.text;
          _accountController.firstName.value = edtfirstname.text;
          _accountController.lastName.value = edtlastname.text;

          _prefs.setString('username', edtUserName.text);

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
  }
}
