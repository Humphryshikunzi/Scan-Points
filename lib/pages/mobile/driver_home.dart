import 'package:carousel_slider/carousel_slider.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/pages/mobile/add_car.dart';
import 'package:pamride/pages/mobile/map_screen.dart';
import 'package:pamride/pages/mobile/edit_car_details_page.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../components/constant.dart';

const bottomBackgroundColor = Color(0xFFF1F2F7);
const leftItemSeparator = const SizedBox(
  width: 30,
);

class CarModel {
  String? name;
  String? image;
  String? plateNumber;
  String? color;
  String? localimg;
  String? blurUrl;

  CarModel({
    this.name,
    this.image,
    this.plateNumber,
    this.color,
    this.localimg,
    this.blurUrl,
  });
}

class PostRidePage extends StatefulWidget {
  @override
  _PostRidePageState createState() => _PostRidePageState();
}

class _PostRidePageState extends State<PostRidePage>
    with WidgetsBindingObserver {
  final _pageController = PageController(viewportFraction: 0.78);
  final _pageNotifier = ValueNotifier(0.0);
  int selectedIndex = 0, selectedBottomIndex = 0;
  Map<String, String> myCars = {};

  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  update() {}

  /// this widget is used to display the header
  Widget _buildHeader() {
    analytics.setCurrentScreen(screenName: "Driver Home Page");

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cars & Trips',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black.withOpacity(0.7)),
                        children: [
                          TextSpan(
                              text: '     Switch To\n',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          TextSpan(
                            text: 'Passenger Mode',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      return Switch(
                        activeColor: ColorsRes.continueShoppingGradient2Color,
                        value: _accountController.isDriver.value,
                        onChanged: (value) {
                          _accountController.isDriver.value = value;
                          _clientController.clearCache();
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 100),
            child: InkWell(
              onTap: () async {
                await Get.to(() => AddCar());
                // initial wa bool result = await Get.to(() => AddCar());
                // do something with result
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Register Car',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.green),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// this widget displays the bottom part of the screen
  // Widget _buildBottomNavigationBar() => Material(
  //       color: ColorsRes.backgroundColor,
  //       elevation: 16,
  //       child:
  //     );

  void _listener() {
    _pageNotifier.value = _pageController.page!;
    setState(() {});
  }

  @override
  void initState() {
    _clientController.clearCache();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    _accountController.carsList = [].obs;
    _accountController.cars = [];
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    getPopularCities();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
    _clientController.update();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _clientController.update();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    OperationRequest<GGetUserCarsData, GGetUserCarsVars> request =
        GGetUserCarsReq((b) => b..vars.email = _accountController.email.value);
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, left: 14.0, right: 14.0),
              child: _buildHeader(),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
              child: Operation(
                  operationRequest: request,
                  client: _clientController.client,
                  builder: (BuildContext context,
                      OperationResponse<GGetUserCarsData, GGetUserCarsVars>?
                          response,
                      Object? error) {
                    if (response!.loading || response.data == null) {
                      return Container(
                        height: 60,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text(
                              'Loading your cars',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      );
                    } else {
                      myCars.clear();

                      if (response.data!.users.isNotEmpty) {
                        for (var car in response.data!.users.first.ownedCars) {
                          myCars[car.licensePlate] = car.id;
                          _accountController.myCars[car.licensePlate] = car.id;
                        }
                      }
                      return response.data?.users.first.ownedCars.isEmpty ??
                              false
                          ? Center(
                              child: Container(
                              margin: EdgeInsets.only(top: 30, bottom: 30),
                              child: Text(
                                  'You do not own any car at the moment...'),
                            ))
                          : Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Select a car to view or edit details',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                  CarouselSlider.builder(
                                    itemCount: response
                                        .data!.users.first.ownedCars.length,
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      reverse: false,
                                      aspectRatio: 5.0,
                                    ),
                                    itemBuilder: (context, i, id) {
                                      String carUrl = getCarImageUrl(response
                                          .data!
                                          .users
                                          .first
                                          .ownedCars[i]
                                          .imageUrl);
                                      CarModel indexedCar = CarModel(
                                          image: carUrl,
                                          name: response.data!.users.first
                                              .ownedCars[i].model,
                                          localimg: carUrl,
                                          blurUrl:
                                              "LDH-x^Os3?ITI^PA%fVFp_xZDi,=",
                                          color: response.data!.users.first
                                              .ownedCars[i].color,
                                          plateNumber: response.data!.users
                                              .first.ownedCars[i].licensePlate);
                                      return GestureDetector(
                                        onTap: () async {
                                          bool update = await Get.to(
                                              EditCarDetailsPage(
                                                  car: indexedCar),
                                              transition: Transition.fadeIn,
                                              duration:
                                                  Duration(milliseconds: 800));
                                          if (update) {
                                            _clientController
                                                .client.requestController
                                                .add(request);
                                          } else {
                                            _clientController
                                                .client.requestController
                                                .add(request);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: OctoImage(
                                              image: NetworkImage(
                                                  indexedCar.image!),
                                              placeholderBuilder:
                                                  OctoPlaceholder.blurHash(
                                                indexedCar.blurUrl!,
                                              ),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              errorBuilder: OctoError.icon(
                                                  color: Colors.black),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                    }
                  }),
            ),
            selectService(),
            InkWell(
              onTap: () {
                _accountController.isDriver == true
                    ? Get.to(() => MapScreen(
                          myCars: myCars,
                        ))
                    : Get.snackbar(
                        "Error", "You have to be a driver to create a trip.");
              },
              splashColor: Colors.orange,
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(
                    top: 8.0, bottom: 10.0, left: 40.0, right: 40.0),
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'CREATE NEW TRIP',
                  style: GoogleFonts.overpass(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                decoration: DesignConfig.buttonShadowColor(
                    ColorsRes.continueShoppingGradient2Color,
                    37,
                    Colors.deepOrangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// function to display the popular locations container
  selectService() {
    // variable to store the details of popular location
    // if index 0 has a title, data has been loaded
    if (Towns[0]['title'] == '') {
      return Container(
        height: 60,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              'Loading Popular Cities & Towns in your Country',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Text(
                  'Start with Popular Cities & Towns in your Country',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: Text(
            'These are common destinations and origins. \n Tap on any to get started',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width,

          // display the popular locations using Listview builder horizontally
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Map<String, dynamic> item = Towns[
                  index]; // store one service list at a time inside the item dynamic map depending on the current index
              return Padding(
                padding: (index != 4)
                    ? EdgeInsets.only(left: fixPadding * 1.0)
                    : EdgeInsets.symmetric(horizontal: fixPadding * 1.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapScreen(
                                  destinationToCompare: item['title'],
                                  myCars: myCars,
                                )));
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // build each container(color,image,title) in the popular locations section
                      Container(
                        width: 60.0,
                        height: 60.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: item['color'],
                        ),
                        child: Image.asset(
                          item['image'],
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 110.0,
                        height: 30.0,
                        alignment: Alignment.bottomCenter,
                        child: Chip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                          label: Text(
                            item['title'].length > 8
                                ? item['title'].substring(0, 8) + '...'
                                : item['title'],
                            style: black14MediumTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
