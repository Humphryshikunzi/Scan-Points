import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/FirebaseImageConstant.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/driver_home.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/client_controller.dart';
import '../../helpers/DesignConfig.dart';

class EditCarDetailsPage extends StatefulWidget {
  CarModel car;

  EditCarDetailsPage({Key? key, required this.car}) : super(key: key);

  @override
  State<EditCarDetailsPage> createState() => _EditCarDetailsPageState();
}

class _EditCarDetailsPageState extends State<EditCarDetailsPage> {
  AccountController _accountController = Get.find<AccountController>();
  ClientController _clientController = Get.find<ClientController>();

  TextEditingController _carModelController = TextEditingController();
  TextEditingController _carColorController = TextEditingController();
  TextEditingController _carImageUrlController = TextEditingController();
  bool isUploading = false;
  String user = 'Guest';

  @override
  void initState() {
    super.initState();
    getPrefs();
    _carImageUrlController.text = widget.car.image ?? '';
    _carColorController.text = widget.car.color ?? '';
    _carModelController.text = widget.car.name ?? '';
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = _prefs.getString("username")!;
    });
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
        } else {
          if (file.size > 10000000) {
            Get.snackbar("Error", "Maximum upload size is 10MB",
                snackPosition: SnackPosition.TOP);
          } else {
            setState(() {
              isUploading = true;
            });
            HttpHelper()
                .uploadFile(
                    file: File.fromUri(Uri.parse(result.files.single.path!)),
                    name: "${user.toUpperCase()}_CAR_${widget.car.plateNumber}",
                    uploadType: "CAR",
                    extension: file.extension.toString(),
                    userId: _accountController.accountId.string,
                    onProgress: (int sentBytes, int totalBytes) {})
                .then((value) {
              setState(() {
                isUploading = false;
              });
              setState(() {
                if (value['complete']) {
                  _carImageUrlController.text = value["fileName"];
                } else {
                  Get.snackbar('Error',
                      'Oops, an error occurred while uploading your car image. Please try again.');
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

  updateCarDetails() {
    _clientController.clearCache();
    SVProgressHUD.show(status: 'Updating car details');
    final updateCarDetailsReq = GUpdateCarDetailsReq((b) => b
      ..vars.active = true
      ..vars.color = _carColorController.text
      ..vars.imageUrl = _carImageUrlController.text
      ..vars.licensePlate = widget.car.plateNumber
      ..vars.model = widget.car.name
      ..vars.ownerId = _accountController.accountId.value);
    _clientController.client.request(updateCarDetailsReq).listen((event) {
      if (event.data != null && event.data?.updateCar.licensePlate != null) {
        SVProgressHUD.dismiss();
        Get.snackbar(
            'Success', 'Your car details have been updated successfully');
      } else {
        SVProgressHUD.dismiss();
      }
    });
  }

  deleteCar() async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String numberPlate = widget.car.plateNumber.toString();

    final MutationOptions options = MutationOptions(
      document: gql('''
    mutation DeleteCar {
      deleteCar(licensePlate: "$numberPlate") {
        licensePlate
      }
    }
  '''),
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back(result: true);
        return Future.value(true);
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: ColorsRes.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 15,
                    left: 15,
                    right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back(result: true);
                        },
                        child: Card(
                          color: ColorsRes.gradientOneColor,
                          shape: DesignConfig.setRoundedBorder(
                              ColorsRes.orangeColor, 8, false),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(),
                child: Hero(
                  tag: 'hero_image_${widget.car.name}',
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: FirebaseImageConstant.isfirebaseimage
                            ? OctoImage(
                                image: NetworkImage(getCarImageUrl(
                                    _carImageUrlController.text)),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                    widget.car.blurUrl!),
                                height: MediaQuery.of(context).size.width / 1.2,
                                errorBuilder:
                                    OctoError.icon(color: Colors.black),
                                fit: BoxFit.fitWidth,
                              )
                            : Image.network(
                                getCarImageUrl(_carImageUrlController.text),
                                height: MediaQuery.of(context).size.width / 1.2,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () {
                                // delete the image here
                                deleteCar();
                                Get.back();
                              },
                              child: SizedBox(
                                width: 120,
                                child: Card(
                                  color: Colors.red,
                                  shape: DesignConfig.setRoundedBorder(
                                      Colors.red, 8, false),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.amber,
                                        ),
                                        Text('Delete Car')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Visibility(
                          visible: isUploading,
                          child: CircularProgressIndicator(
                            color: ColorsRes.gradientOneColor,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                pickCarImage();
                              },
                              child: SizedBox(
                                width: 150,
                                child: Card(
                                  color: ColorsRes.green,
                                  shape: DesignConfig.setRoundedBorder(
                                      ColorsRes.green, 8, false),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: ColorsRes.black,
                                        ),
                                        Text('Edit Image'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Car Details',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Car Model',
                                  ),
                                  initialValue: widget.car.name,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Plate Number',
                                  ),
                                  onChanged: (value) {
                                    widget.car.plateNumber = value;
                                  },
                                  initialValue: widget.car.plateNumber,
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(),
                                    ],
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  controller: _carColorController,
                                  decoration: InputDecoration(
                                    labelText: 'Color',
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(),
                                    ],
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            GestureDetector(
                              onTap: () {
                                updateCarDetails();
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.7,
                                padding: EdgeInsets.only(top: 13, bottom: 13),
                                alignment: Alignment.center,
                                decoration: DesignConfig.buttonShadowColor(
                                    ColorsRes.continueShoppingGradient1Color,
                                    37,
                                    ColorsRes.continueShoppingGradient2Color),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
