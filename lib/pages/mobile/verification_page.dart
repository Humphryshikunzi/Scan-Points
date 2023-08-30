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
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/add_profile_page.dart';
import 'package:pamride/pages/mobile/driver_home.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';
import 'home_page.dart';

class VerificationPage extends StatefulWidget {
  final bool? verifyLater;
  const VerificationPage({
    bool this.verifyLater = false,
    Key? key,
  }) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController licenceNumber = TextEditingController();
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool acceptterms = false;
  dynamic Function(Map)? parserFn;
  bool isPassenger = true;
  bool isLoading = false;
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();

  bool frontLicenseUploaded = false;
  bool backLicenseUploaded = false;

  bool isUploadingFront = false;
  bool isUploadingBack = false;

  String? frontFile;
  String? backFile;

  String frontLicenseUrl = '';
  String backLicenseUrl = '';

  String user = 'Guest', email = '', imageName = '';

  @override
  void initState() {
    getPrefs();
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = _prefs.getString("username")!;
      email = _prefs.getString("email")!;
      imageName = _prefs.getString("profileImageName")!;
      _accountController.imageName = _prefs.getString("profileImageName")!.obs;
    });
  }

  /// function to select user image from local storage and save it to the server
  pickUpdateUserImage({required bool isFront}) async {
    if (await Permission.storage.request().isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if ((result.files.single.bytes ?? []).isEmpty) {
          //
        } else {
          if (file.size > 10000000) {
            Get.snackbar("Error", "Maximum upload size is 10MB",
                snackPosition: SnackPosition.TOP);
          } else {
            setState(() {
              if (isFront) {
                isUploadingFront = true;
              } else {
                isUploadingBack = true;
              }
            });
            HttpHelper()
                .uploadFile(
                    file: File.fromUri(Uri.parse(result.files.single.path!)),
                    name:
                        "${user.toUpperCase()}_${isFront ? 'LICENCE_FRONT' : 'LICENCE_BACK'}",
                    uploadType: "LICENCE",
                    extension: file.extension.toString(),
                    userId: _accountController.accountId.string,
                    onProgress: (int sentBytes, int totalBytes) {})
                .then((value) {
              setState(() {
                if (isFront) {
                  isUploadingFront = false;
                } else {
                  isUploadingBack = false;
                }
              });
              setState(() {
                if (value['complete']) {
                  if (isFront) {
                    frontFile = file.path;
                    frontLicenseUploaded = true;
                  } else {
                    backFile = file.path;
                    backLicenseUploaded = true;
                  }
                  imageName = value["fileName"];
                  if (isFront) {
                    frontLicenseUrl = imageName;
                  } else {
                    backLicenseUrl = imageName;
                  }
                } else {
                  Get.snackbar('Error',
                      'Oops, an error occurred while uploading your profile image. Please try again.');
                }
              });
            });
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
        body: SingleChildScrollView(
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
                        Get.off(HomePage());
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
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).size.width * 0.5,
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
                        "Driving License Verification",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .merge(TextStyle(
                                color: ColorsRes.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        pickUpdateUserImage(isFront: true);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          border: Border.all(color: Colors.green, width: 0.5),
                          color: Colors.white,
                        ),
                        child: Visibility(
                          visible: !frontLicenseUploaded,
                          replacement: Image.file(File(frontFile ?? ''),
                              fit: BoxFit.fitWidth),
                          child: !isUploadingFront
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: ColorsRes.gradientOneColor,
                                    ),
                                    Text(
                                      "Upload",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsRes.gradientOneColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    MaterialButton(
                      color: frontLicenseUploaded
                          ? Colors.grey
                          : ColorsRes.gradientTwoColor,
                      child: Text(
                        frontLicenseUploaded
                            ? "Front licence uploaded"
                            : "Upload front of licence",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        pickUpdateUserImage(isFront: true);
                      },
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        pickUpdateUserImage(isFront: false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          border: Border.all(color: Colors.green, width: 0.5),
                          color: Colors.white,
                        ),
                        child: Visibility(
                          visible: !backLicenseUploaded,
                          replacement: Image.file(File(backFile ?? ''),
                              fit: BoxFit.fitWidth),
                          child: !isUploadingBack
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: ColorsRes.gradientOneColor,
                                    ),
                                    Text(
                                      "Upload",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsRes.gradientOneColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    MaterialButton(
                      color: backLicenseUploaded
                          ? Colors.grey
                          : ColorsRes.gradientTwoColor,
                      child: Text(
                        backLicenseUploaded
                            ? "Back licence uploaded"
                            : "Upload back of licence",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (!backLicenseUploaded) {
                          pickUpdateUserImage(isFront: false);
                        }
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// verify identity button
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 20),
                          child: ButtonClickAnimation(
                            onTap: () {
                              if (frontLicenseUploaded && backLicenseUploaded) {
                                _accountController.isDriver = true.obs;
                                updateUserDocs();
                              } else {
                                Get.snackbar('You can\'t proceed.',
                                    'Please upload the required documents');
                              }
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding: EdgeInsets.only(top: 13, bottom: 13),
                                alignment: Alignment.center,
                                decoration: DesignConfig.buttonShadowColor(
                                    frontLicenseUploaded && backLicenseUploaded
                                        ? ColorsRes.green
                                        : Colors.grey,
                                    37,
                                    frontLicenseUploaded && backLicenseUploaded
                                        ? ColorsRes.green
                                        : Colors.grey),
                                child: Text(
                                  "Continue",
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

                        /// verify identity button
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 20),
                          child: ButtonClickAnimation(
                            onTap: () {
                              Get.to(AddProfilePage(
                                isDriver: true,
                              ));
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding: EdgeInsets.only(top: 13, bottom: 13),
                                alignment: Alignment.center,
                                decoration: DesignConfig.buttonShadowColor(
                                    ColorsRes.continueShoppingGradient1Color,
                                    37,
                                    ColorsRes.continueShoppingGradient2Color),
                                child: Text(
                                  "Upload later?",
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
                    )
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

  void updateUserDocs() async {
    SVProgressHUD.show(status: "Saving...");
    final updateUserDocReq = GUpdateLicenceDocumentsReq((b) => b
      ..vars.email = email
      ..vars.licenseFront = frontLicenseUrl
      ..vars.licenseRear = backLicenseUrl
      ..vars.nationalIdBack = ''
      ..vars.nationalIdFront = ''
      ..vars.updatedBy = user
      ..vars.id = 0
      ..vars.updatedBy = _accountController.userName.value);
    _clientController.client.request(updateUserDocReq).listen((event) {
      if (event.data!.updateUserDocuments.succeeded) {
        SVProgressHUD.dismiss();
        widget.verifyLater == true
            ? Get.off(() => PostRidePage())
            : Get.to(AddProfilePage(
                isDriver: true,
              ));
      } else {
        SVProgressHUD.dismiss();
      }
    });
  }
}
