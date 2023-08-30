import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/widgets/rides_search_algolia.dart';
import 'package:pamride/widgets/search_overlay.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/constant.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late OverlayEntry floatingDropdown;
  bool serviceEnabled = false;
  bool isDropdownOpened = false;
  bool isPopularPlacesLoaded = false;
  late LocationPermission permission;
  OverlayEntry? overlayEntry;
  String? selectedTitle;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String userLocation = "";
  ScrollController _scrollController = ScrollController();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics.setCurrentScreen(screenName: 'Landing Page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: ColorsRes.backgroundColor,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          /// Set the transparency here
          canvasColor: Colors
              .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Drawer(
          width: MediaQuery.of(context).size.width,
          child: SearchRidesPage(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1000,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  popularLocations(),
                ],
              ),
              Visibility(
                visible: _scrollController.hasClients &&
                    _scrollController.offset >
                        MediaQuery.of(context).size.height,
                child: InkWell(
                  onTap: () {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(10,
                          duration: Duration(seconds: 3), curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height - 90),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // search bar
  popularLocations() {
    return Stack(
      children: [
        Positioned.fill(
          child: landingPageBanner(),
        ),
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
            bottom: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.height * 0.01,
            right: MediaQuery.of(context).size.height * 0.01,
          ),
          child: searchBar(),
        )),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: selectService(),
          ),
        ),
      ],
    );
  }

  // bg banner
  landingPageBanner() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/banner.jpeg',
            color: Colors.white.withOpacity(0.9),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// function to display the search bar for searching a ride
  searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: InkWell(
        onTap: () {
          /// open the search overlay widget
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            _scaffoldKey.currentState!.openEndDrawer();
          } else {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 1.0,
                color: blackColor.withOpacity(0.25),
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 24.0,
                color: primaryColor,
              ),
              widthSpace,
              Text(
                'Search for offers',
                style: grey14MediumTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// function to display the popular locations container
  selectService() {
    // if index 0 has a title, data has been loaded
    if (isPopularPlacesLoaded == false) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Stack(
              children: [
                Text(
                  'Loading Partner Companies',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  'Loading Partner Companies',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
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
          padding: const EdgeInsets.all(fixPadding * 2.0),
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Text(
                  'See Ads from Popular Partner Companies',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: fixPadding * 4.0),

          // display the popular locations using Listview builder horizontally
          child: ListView.builder(
            itemCount: Towns.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Map<String, dynamic> item = Towns[
                  index]; // store one service list at a time inside the item dynamic map depending on the current index
              return Padding(
                padding: (index != Towns.length - 1)
                    ? const EdgeInsets.only(left: fixPadding * 2.0)
                    : const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTitle = item['title'];
                    });
                    // showOverlay(context); // Call the method to show the overlay

                    // if (_scaffoldKey.currentState!.isDrawerOpen) {
                    //   _scaffoldKey.currentState!.openEndDrawer();
                    // } else {
                    //   _scaffoldKey.currentState!.openDrawer();
                    // }
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: item['color'],
                        ),
                        child: Image.asset(
                          item['image'],
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 95.0,
                        height: 30.0,
                        alignment: Alignment.bottomCenter,
                        child: Chip(
                          backgroundColor: Colors.white,
                          label: Text(
                            item['title'].length > 8
                                ? item['title'].substring(0, 8) + '...'
                                : item['title'].length > 2
                                    ? item['title']
                                    : 'Ads',
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

  Future<void> showOverlay(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('overlayTitle', selectedTitle!);
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return SearchOverlay(
          origin: selectedTitle,
        );
      },
    );
  }
}
