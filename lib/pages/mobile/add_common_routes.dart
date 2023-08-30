import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/components/constant.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/pages/mobile/home_page.dart';
import 'package:pamride/pages/mobile/search_result_page.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FrequentRoutes extends StatefulWidget {
  const FrequentRoutes({Key? key}) : super(key: key);

  @override
  State<FrequentRoutes> createState() => _FrequentRoutesState();
}

class _FrequentRoutesState extends State<FrequentRoutes> {
  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // variables for storing the route details
  String origin = "";
  String destination = "";
  bool saveReady = false;
  List<LocationData>? locations;
  String? accountId;
  String? userName = "";

  // toast for successful addition of car
  void routeOperationStatus(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.orange,
        fontSize: 14.0);
  }

  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      accountId = _prefs.getString('accountId');
      userName = _prefs.getString('username')!;
    });

    analytics.logEvent(name: 'FrequentRoutes_Page_Opened', parameters: null);
  }

  Future<void> GetMyFavRoutes() async {
    if (userName == "") {
      return;
    }
    final getUserIdReq =
        GGetUserWithFilterReq((b) => b..vars.userName = userName);
    _clientController.client.request(getUserIdReq).listen((event) {
      if (event.data!.users.first.id!.isNotEmpty) {
        List<LocationData> locationDataCloudList = [];

        for (var route in event.data!.users.first.frequentRoutes) {
          LocationData locationDataCloud = LocationData(
              origin: route.origin,
              image: 'assets/images/location.png',
              id: route.id.toString(),
              color: ColorCustom(
                int.parse(route.color.a),
                int.parse(route.color.r),
                int.parse(route.color.g),
                int.parse(route.color.b),
              ),
              destination: route.destination);
          locationDataCloudList.add(locationDataCloud);
        }

        setState(() {
          locations = locationDataCloudList;
        });
      }
    });
  }

  setNewLocation(LocationData locationData) async {
    locationData.color = getColor();
    locationData.image = "";

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String query = '''
        mutation {
        createFrequentRoute(
          frequentRoute: {
            destination:"${locationData.destination}"  
            origin: "${locationData.origin}"
            image: "${locationData.image}"
            id: 0
            color: { a: "${locationData.color!.a.toString()}", 
                     r: "${locationData.color!.r.toString()}", 
                     g: "${locationData.color!.a.toString()}", 
                     b: "${locationData.color!.a.toString()}",
                     id: 0 }
            
            userId: "${accountId}"
          }
        ) {
          data
          messages
        }
      }

  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      routeOperationStatus("Route has not been saved");
      return;
    } else {
      routeOperationStatus("Route has been successfully saved");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FrequentRoutes()),
      );
    }
    analytics.logEvent(name: 'FrequentRoutes_Added', parameters: null);
  }

  deleteLocation(String routeId) async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String query = '''
        mutation {
  removeFrequentRoute(rideId: $routeId, username: "${userName}") {
    succeeded
    messages
  }
}

  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      routeOperationStatus("Route has not been deleted");
      return;
    } else {
      routeOperationStatus("Route has been successfully deleted");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FrequentRoutes()),
      );
    }
    analytics.logEvent(name: 'FrequentRoutes_Deleted', parameters: null);
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: WillPopScope(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Colors.green,
                ],
              )),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => HomePage()),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                        Center(
                          child: Text(
                            "My Frequent Routes",
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width * 0.6,
                                margin: EdgeInsets.only(top: 50),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Origin",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextField(
                                        onChanged: ((value) {
                                          setState(() {
                                            origin = value;
                                            if (destination != "" &&
                                                origin != "") {
                                              saveReady = true;
                                            } else {
                                              saveReady = false;
                                            }
                                            ;
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.transparent,
                                            ),
                                            labelText: "Origin",
                                            labelStyle: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Destination",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextField(
                                        onChanged: ((value) {
                                          setState(() {
                                            destination = value;
                                            if (origin != "" &&
                                                destination != "") {
                                              saveReady = true;
                                            } else {
                                              saveReady = false;
                                            }
                                            ;
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.transparent,
                                            ),
                                            labelText: "Destination",
                                            labelStyle: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: ElevatedButton(
                                  onPressed: saveReady
                                      ? () {
                                          LocationData locationData =
                                              LocationData(
                                            origin: origin,
                                            destination: destination,
                                            image: "",
                                          );
                                          setNewLocation(locationData);
                                        }
                                      : () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: saveReady
                                          ? Colors.orange
                                          : Colors.grey,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  child: Text("Save"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: selectService(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomePage()),
            );
            return true;
          },
        ));
  }

  /// function to display the popular locations container
  selectService() {
    if (locations == null) {
      GetMyFavRoutes();
      return CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Text(
                  locations!.length == 0
                      ? "Save your frequent routes here"
                      : 'Choose any of these frequent routes to search and book a ride',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 105.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: locations!.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              LocationData locationData = locations![index];
              String origin = locationData.origin;
              String destination = locationData.destination;
              origin =
                  origin.length > 7 ? origin.substring(0, 7) + '..' : origin;
              destination = destination.length > 7
                  ? destination.substring(0, 7) + '..'
                  : destination;
              String title = origin + " - \n" + destination;

              return Padding(
                padding: (index != locations!.length - 1)
                    ? const EdgeInsets.only(left: fixPadding * 2.0)
                    : const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: InkWell(
                  onTap: () {
                    _showAlertSheet(context, locationData);
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(
                              locationData.color!.a,
                              locationData.color!.r,
                              locationData.color!.g,
                              locationData.color!.b),
                        ),
                        child: Image.asset(
                          locationData.image,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 80.0,
                        height: 25.0,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          title,
                          style: black12RegularTextStyle,
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

  void _showAlertSheet(BuildContext context, LocationData locationData) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Center(
                  child: Text(
                    'Select Action',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book_online),
                title: Text('Search Ride'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Perform book operation
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              originToCompare: locationData.origin,
                              destinationToCompare: locationData.destination)));
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Route'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Perform delete operation
                  deleteLocation(locationData.id!);
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Close'),
                onTap: () {
                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// function to display the popular locations container
  ColorCustom getColor() {
    Random random = Random();

    int min = 0;
    int max = 255;

    int randomNumberA = min + random.nextInt(max - min + 1);
    int randomNumberR = min + random.nextInt(max - min + 1);
    int randomNumberG = min + random.nextInt(max - min + 1);
    int randomNumberB = min + random.nextInt(max - min + 1);
    ColorCustom colorCustom =
        ColorCustom(randomNumberA, randomNumberR, randomNumberG, randomNumberB);

    return colorCustom;
  }
}

class LocationData {
  final String origin;
  final String destination;
  String image;
  ColorCustom? color;
  String? id;

  LocationData({
    required this.origin,
    required this.destination,
    required this.image,
    this.color,
    this.id,
  });
}

class ColorCustom {
  final int a;
  final int r;
  final int g;
  final int b;

  ColorCustom(this.a, this.r, this.g, this.b);
}
