import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/schema.schema.gql.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../graphql/__generated__/operations.req.gql.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();
  TextEditingController plateNumberController = TextEditingController();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final singlePicker = ImagePicker();
  final multiPicker = ImagePicker();

  File? image;
  bool uploadReady = false;
  bool uploading = false;
  bool licenseFormatted = false; 
  String carModel = "";
  String carColor = "";
  String carLicensePlate = "";
  String carImageURL = '';
  String user = "";
  String email = ""; 
  String carImageName = '';

  // toast for successful addition of car
  void carAdditionSuccess() {
    Fluttertoast.showToast(
        msg: "Car has been successfully added",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.orange,
        fontSize: 14.0);
        
        analytics.logEvent(name: "car_added", parameters: {
          "car_model": carModel,
          "car_color": carColor,
          "car_license_plate": carLicensePlate,
          "car_image_url": carImageURL, 
        });
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = _prefs.getString("username")!;
      email = _prefs.getString("email")!;
    });

    analytics.logEvent(name: "add_car_page_opened", parameters: null);
  }

  Future<double> getImageSizeInMb(File file) async {
    int sizeInBytes = await file.length();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  pickCarImage() async {
    if (await Permission.storage.request().isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if ((result.files.single.bytes ?? []).isEmpty) { 
          SVProgressHUD.showInfo(status: "Saving image...");
          HttpHelper()
              .uploadFile(
                  file: File.fromUri(Uri.parse(result.files.single.path!)),
                  name:
                      "${user.toUpperCase()}_CAR_${plateNumberController.text}",
                  uploadType: "CAR",
                  extension: file.extension.toString(),
                  userId: _accountController.accountId.string,
                  onProgress: (int sentBytes, int totalBytes) {
                    SVProgressHUD.showProgress(
                        ((sentBytes / totalBytes) * 100).round(),
                        status: "Uploading...");
                  })
              .then((value) {
            SVProgressHUD.dismiss();
            if (value['fileName']) {
              Get.snackbar("Success", "Image has been uploaded successfully",
                  snackPosition: SnackPosition.TOP);
              setState(() {
                carImageURL = value['fileName'];
                uploading = false;
                uploadReady = true;
              });
            }
          });
        } else {
          if (await getImageSizeInMb(File(file.path ?? '')) > 10.0) {
            Get.snackbar("Error", "Maximum upload size is 10MB",
                snackPosition: SnackPosition.TOP);
          } else {
            SVProgressHUD.show(status: "Saving image...");
            HttpHelper()
                .uploadFile(
                    file: File.fromUri(Uri.parse(result.files.single.path!)),
                    name:
                        "${user.toUpperCase()}_CAR_${plateNumberController.text}",
                    uploadType: "CAR",
                    extension: file.extension.toString(),
                    userId: _accountController.accountId.string,
                    onProgress: (int sentBytes, int totalBytes) {
                      SVProgressHUD.showProgress(
                          ((sentBytes / totalBytes) * 100),
                          status: "Uploading image...");
                    })
                .then((value) {
              SVProgressHUD.dismiss();
              if (value['complete']) {
                Get.snackbar("Success", "Image has been uploaded successfully",
                    snackPosition: SnackPosition.TOP);
                setState(() {
                  carImageURL = value['fileName'];
                  uploading = false;
                  uploadReady = true;
                });
              } else {
                Get.snackbar("Error", "An error occurred while uploading image",
                    snackPosition: SnackPosition.TOP);
              }
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

  // method to show the car photo
  void showCarPhoto(final result) {
    final file = result?.files.first;
    OpenFile.open(file.path!);
    setState(() {
      carImageName = _accountController.userName.value!.toUpperCase() + "_CAR_";
      carImageURL = _accountController.userName.value!.toUpperCase() + "_CAR_";
    });
  }

  uploadFiles(String extension, String fileName, dynamic bytes) {
    setState(() {
      uploading = true;
    });

    final saveFile = GSaveUserFileStringReq((b) => b
      ..vars.fileExtension = extension
      ..vars.data = bytes.toString()
      ..vars.fileName = fileName
      ..vars.uploadType = GUploadType.CAR);
    _clientController.client.request(saveFile).listen((event) {
      if (event.data != null) {
        updateImageUrl(event.data!.saveFlUploadeFile.split('/').last);
      }
    });
  }

  updateImageUrl(String imageUrl) {
    setState(() {
      carImageURL = imageUrl;
      uploading = false;
      uploadReady = true;
    });
  }

  String formatLicensePlate(String input) {
    // Remove any non-alphanumeric characters from input
    input = input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    // Convert input to uppercase
    input = input.toUpperCase();

    // Check if input has a valid format for a Kenyan car license plate
    if (RegExp(r'^[A-Z]{3}[0-9]{3}[A-Z]$').hasMatch(input)) {
      // Insert a space between the third and fourth characters

      setState(() {
        licenseFormatted = true;
      });
      return input.replaceRange(3, 3, ' ');
    } else {
      setState(() {
        licenseFormatted = false;
      });
      return input.toUpperCase();
    }
  }

  // method to show car photos
  void showCarPhotos(List<PlatformFile> file) {}

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.orange,
            ],
          )),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    Center(
                      child: Text(
                        "Register Car",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.52,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Model",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    onChanged: ((value) {
                                      setState(() {
                                        carModel = value;
                                      });
                                    }),
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.transparent,
                                        ),
                                        labelText: "Model",
                                        labelStyle: TextStyle(
                                            color: Colors.green, fontSize: 11),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Color",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    onChanged: ((value) {
                                      setState(() {
                                        carColor = value;
                                      });
                                    }),
                                    style: TextStyle(fontSize: 16),
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.transparent,
                                        ),
                                        labelText: "Color",
                                        labelStyle: TextStyle(
                                            color: Colors.green, fontSize: 11),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Number plate",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    controller: plateNumberController,
                                    onChanged: ((value) {
                                      String formatted =
                                          formatLicensePlate(value);
                                      setState(() {
                                        plateNumberController.value =
                                            TextEditingValue(
                                          text: formatted,
                                          selection: TextSelection.collapsed(
                                              offset: formatted.length),
                                        );
                                      });
                                    }),
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: licenseFormatted
                                                ? Colors.grey
                                                : Colors.red,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: licenseFormatted
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.transparent,
                                        ),
                                        labelText: "Number plate",
                                        labelStyle: TextStyle(
                                            color: Colors.orange, fontSize: 11),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    pickCarImage();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Upload photo",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            pickCarImage();
                                          },
                                          icon: Icon(
                                            Icons.upload,
                                            color: Colors.orange,
                                            size: 25,
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1, 1),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: !uploading
                                        ? Text(
                                            uploadReady
                                                ? "${carImageURL}"
                                                : "N/A",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CircularProgressIndicator(
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                'Uploading...',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: uploadReady
                            ? () {
                                // parameter passing variable
                                final addCarRequest = GCreateCarReq((b) => b
                                  ..vars.model = carModel
                                  ..vars.licensePlate =
                                      plateNumberController.text
                                  ..vars.color = carColor
                                  ..vars.id = ""
                                  ..vars.imageUrl = carImageURL
                                  ..vars.ownerId =
                                      _accountController.accountId.value
                                  ..vars.active = true);
                                // sending data to the server
                                _clientController.client
                                    .request(addCarRequest)
                                    .listen((event) {
                                  if (!event.loading) {
                                    Get.back();
                                  }
                                });
                                carAdditionSuccess();
                                _clientController.update();
                                Get.back(result: true);
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                            primary: uploadReady ? Colors.orange : Colors.grey,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        child: Text("Register"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
