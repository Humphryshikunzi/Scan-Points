import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/provider/theme_provider.dart';
import 'package:pamride/widgets/drawer_header.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:provider/provider.dart';
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
  var currentPage = DrawerSections.dashboard;

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
      drawer: Theme(
        data: Theme.of(context),
        child: Drawer(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(),
                ],
              ),
            ),
          ), //SearchOffers(),
        ),
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
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
                  upcomingGames(),
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
  upcomingGames() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.015,
              bottom: MediaQuery.of(context).size.height * 0.01,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Theme.of(context)
                            .iconTheme
                            .color, // Use the theme's icon color
                        size: 24,
                      ), // Notification icon
                      onPressed: () {
                        // Add your button's action here
                        // This function will be called when the button is pressed
                      },
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:
                              Colors.red, // Background color for the indicator
                          shape: BoxShape.circle, // Make it a circle
                        ),
                        child: Text(
                          '3', // The text you want to display
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold,
                            fontSize: 10, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_vert), // "more_vert" icon
                  onPressed: () {
                    // Add your button's action here
                    // This function will be called when the button is pressed
                    if (_scaffoldKey.currentState!.isDrawerOpen) {
                      _scaffoldKey.currentState!.openEndDrawer();
                    } else {
                      _scaffoldKey.currentState!.openDrawer();
                    }
                  },
                ),
              ],
            )),
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.16,
            bottom: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.height * 0.01,
            right: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(translation(context).appDescription),
        )),
        Positioned(
            child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(translation(context).seeAll),
                        seeAll(),
                      ],
                    ),
                    Column(
                      children: [
                        Text(translation(context).usePoints),
                        usePoints(),
                      ],
                    ),
                  ],
                ))),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: selectService(),
          ),
        ),
      ],
    );
  }

  usePoints() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Adjust the value as needed
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 150,
            ),
          ],
        ));
  }

  seeAll() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Adjust the value as needed
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 150,
            ),
          ],
        ));
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
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 1.0,
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
        height: 200,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(translation(context).nextMatches, style: black16BoldTextStyle),
            SizedBox(height: 10),
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Stack(
              children: [
                Text(
                  translation(context).loadingNextMatches,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  translation(context).loadingNextMatches,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
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

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Change Language", Icons.language,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Favorite", Icons.favorite,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "My Reward", Icons.present_to_all,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "About Entema", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          menuItem(4, "Contact Us", Icons.contact_support,
              currentPage == DrawerSections.notes ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? ColorsRes.secondaryColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
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

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
