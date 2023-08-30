import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/helpers/graphql_helper.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/login_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';

List<Map<String, String>> Countries = [
  {'name': 'Kenya', 'code': '+254', 'abbrev': 'ke'},
  {'name': 'Uganda', 'code': '+256', 'abbrev': 'ug'},
  {'name': 'Tanzania', 'code': '+255', 'abbrev': 'tz'},
  {'name': 'Rwanda', 'code': '+250', 'abbrev': 'rw'},
  {'name': 'Somalia', 'code': '+252', 'abbrev': 'so'},
  {'name': 'South Sudan', 'code': '+211', 'abbrev': 'ss'},
];

List<Map<String, String>> Clubs = [
  {'name': 'Al-Hilal', 'abbrev': 'HIL', 'league': "1"},
  {'name': 'Al-Nassr', 'abbrev': 'NAS', 'league': "1"},
  {'name': 'Al-Ittihad', 'abbrev': 'ITT', 'league': "1"},
  {'name': 'Al-Ahli', 'abbrev': 'AHL', "league": "1"},
];

dynamic Towns = [
  {'title': '', 'image': 'assets/images/addidas.jpg', 'color': Colors.red},
  {'title': '', 'image': 'assets/images/addidas_2.jpg', 'color': Colors.orange},
  {
    'title': '',
    'image': 'assets/images/foot_ad.jpg',
    'color': Color.fromARGB(255, 76, 132, 175)
  },
  {'title': '', 'image': 'assets/images/location.png', 'color': Colors.blue},
  {'title': '', 'image': 'assets/images/location.png', 'color': Colors.green},
];

Future<void> getPopularCities() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  List<String> locationsList = _prefs.getStringList("pLocations") ?? [];
  if (locationsList.length > 0) {
    for (var i = 0; i < locationsList.length; i++) {
      String town = locationsList[i];
      Towns[i]['title'] = town;
    }
    return;
  }

  String cAbbrev;
  String? cAbbrevStr = _prefs.getString("cAbbrev");
  if (cAbbrevStr == null) {
    cAbbrev = 'ug';
  } else {
    cAbbrev = cAbbrevStr;
  }
  String query = """
    query {
      location(
        where: {
          isPopular: { eq: true }
          and: { country: { abbrev: { eq: "$cAbbrev" } } }
        }
      ) {
        town
        id
        country {
          id
          name
          code
        }
      }
    }
  """;

// Create the GraphQL client with the concatenated link and cache
  final GraphQLClient client = GraphQLClient(
    link: await getLinkAndToken(),
    cache: GraphQLCache(),
  );

  // Create the GraphQL query options
  final QueryOptions options = QueryOptions(document: gql(query));

  // Send the GraphQL query
  final QueryResult result = await client.query(options);

  // Check for errors
  if (result.hasException) {
    return;
  }
  // Extract the desired information from the response
  final List<dynamic> locations = result.data!['location'];

  for (var i = 0; i < 5; i++) {
    String town = locations[i]['town'];
    Towns[i]['title'] = town;
    locationsList.add(town);
  }

  _prefs.setStringList("pLocations", locationsList);
}

Future<Link> getLinkAndToken() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  // Create an AuthLink instance with your authorization token
  final AuthLink authLink = AuthLink(getToken: () async {
    // Replace 'YOUR_AUTH_TOKEN' with the actual authorization token
    var token = await _prefs.getString('token');
    if (token == null) {
      token = '';
    }
    return token;
  });

// Create a HttpLink with the GraphQL API endpoint
  final HttpLink httpLink = HttpLink(Constant.mainUrl);

// Concatenate the AuthLink and HttpLink using the Link.concat method
  final Link link = Link.concat(authLink, httpLink);

  return link;
}

Future<String> getAuthToken() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var token = await _prefs.getString('token');
  if (token == null) {
    token = '';
  }
  return token;
}

shareApp(BuildContext context, String referralCode) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: lightBack)),
    child: ListTile(
      dense: true,
      title: Text(
        'Share app',
        style: TextStyle(fontSize: 15),
      ),
      leading: Container(
          decoration: BoxDecoration(
              color: primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.share_outlined,
            color: ColorsRes.secondaryColor,
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: ColorsRes.secondaryColor,
      ),
      onTap: () async {
        final box = context.findRenderObject() as RenderBox?;

        await Share.share(
          "" + referralCode,
          subject: 'Share Mobile App',
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      },
    ),
  );
}

missionVision() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: lightBack)),
    child: ListTile(
      dense: true,
      title: Text(
        'Privacy Policy',
        style: TextStyle(fontSize: 15),
      ),
      leading: Container(
          decoration: BoxDecoration(
              color: primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.privacy_tip_outlined,
            color: ColorsRes.secondaryColor,
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: ColorsRes.secondaryColor,
      ),
      onTap: () {
        //Get.to(() => PrivacyPolicy());
      },
    ),
  );
}

termsAndConditions() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: lightBack)),
    child: ListTile(
      dense: true,
      title: Text(
        'Terms & Conditions',
        style: TextStyle(fontSize: 15),
      ),
      leading: Container(
          decoration: BoxDecoration(
              color: primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.web,
            color: ColorsRes.secondaryColor,
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: ColorsRes.secondaryColor,
      ),
      onTap: () {
        //Get.to(() => TermsAndConditions());
      },
    ),
  );
}

rateAppOnPlayStore() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: lightBack)),
    child: ListTile(
      dense: true,
      title: Text(
        'Rate app',
        style: TextStyle(fontSize: 15),
      ),
      leading: Container(
          decoration: BoxDecoration(
              color: primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.star_rate,
            color: ColorsRes.secondaryColor,
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: ColorsRes.secondaryColor,
      ),
      onTap: () async {
        String url = Constant.googlePlayUrl;
        final Uri uri = Uri.parse(url);
        //await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
      },
    ),
  );
}

support() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: lightBack)),
    child: ListTile(
        dense: true,
        title: Text(
          'Support',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.support_agent,
              color: ColorsRes.secondaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: ColorsRes.secondaryColor,
        ),
        onTap: () async {
          //Get.to(() => SupportPage());
        }),
  );
}

logOut(AccountController accountController, BuildContext context) {
  return Container(
      child: GestureDetector(
    onTap: () async {
      accountController.isLoggedIn = false.obs;

      final preferences = await SharedPreferences.getInstance();

      List<String>? existingMessages = preferences.getStringList("messages");
      List<String>? existingIndividualMessages =
          preferences.getStringList("individualMessages");

      await preferences.clear();

      await preferences.setStringList("messages", existingMessages ?? []);
      await preferences.setStringList(
          "individualMessages", existingIndividualMessages ?? []);
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
              builder: (context) => LoginActivity(
                    backButtonEnabled: true,
                  )),
          (route) => false);
    },
    child: Row(
      children: [
        Text(
          'Logout',
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
        IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ))
      ],
    ),
  ));
}

/// function to select user image from local storage and save it to the server
Future<void> pickUpdateUserImage(AccountController accountController,
    String userName, Function stoploading) async {
  if (await Permission.storage.request().isGranted) {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      if ((result.files.single.bytes ?? []).isEmpty) {
        // do something
      } else {
        if (file.size > 10000000) {
          Get.snackbar("Error", "Maximum upload size is 10MB",
              snackPosition: SnackPosition.TOP);
        } else {
          HttpHelper()
              .uploadFile(
                  file: File.fromUri(Uri.parse(result.files.single.path!)),
                  name: "${userName.toUpperCase()}_PROFILE",
                  uploadType: "PROFILE",
                  extension: file.extension.toString(),
                  userId: accountController.accountId.string,
                  onProgress: (int sentBytes, int totalBytes) {})
              .then(
            (value) {
              if (value['complete']) {
                String imageName = value["fileName"];
                updateImageUrl(accountController, imageName);
                updateUserProfileImage(imageName).then((value) {
                  if (value) {
                    Fluttertoast.showToast(
                        msg: "Profile image updated",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Profile image not updated",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0);
                  }
                  stoploading();
                });
              } else {
                Get.snackbar('Error',
                    'Oops, an error occurred while uploading your profile image. Please try again.');
              }
            },
          );
        }
      }
    } else {
      // User cancelled the picker
    }
  } else {
    Permission.storage.request();
  }
}

updateImageUrl(AccountController accountController, String imageName) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString("profileImageName", imageName);
  accountController.profileImage = imageName.obs;
}

// review item
class ReviewItem {
  final String reviewerName;
  final String reviewContent;
  final double starRating;
  final String date;

  const ReviewItem({
    required this.reviewerName,
    required this.reviewContent,
    required this.starRating,
    required this.date,
  });
}

// review container
class ReviewContainer extends StatelessWidget {
  final String review;
  final String reviewer;
  final double ratingValue;
  final String date;

  const ReviewContainer({
    required this.review,
    required this.reviewer,
    required this.ratingValue,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 16.0, bottom: 16.0, left: 10.0, right: 10.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review,
            style: TextStyle(fontSize: 16.0),
            softWrap: true,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.0),
          Text(
            'Reviewer: $reviewer',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 16.0,
              ),
              SizedBox(width: 4.0),
              Text(
                ratingValue.toString(),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(width: 8.0),
              Text(
                'Date: $date',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PanicButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const PanicButtonWidget({this.height, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController _accountController = Get.find();
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return GestureDetector(
      onTap: () {
        // Implement panic button functionality here
        // For now, we'll just print a message

        var parameters = {
          'userId': _accountController.accountId.string,
          'role': _accountController.isDriver.value ? 'driver' : 'passenger',
        };

        analytics.logEvent(
            name: 'panic_button_pressed', parameters: parameters);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('SOS Button'),
              content: Text(
                  'Are you sure you want to trigger the SOS action?\n\n'
                  'This will send an emergency alert to pamride emergency service team.'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    analytics.logEvent(
                        name: 'panic_button_cancelled', parameters: parameters);
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                ElevatedButton(
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    _makeSOSDistressCall(_accountController.accountId.string);
                    analytics.logEvent(
                        name: 'panic_button_confirmed', parameters: parameters);
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              25), // Set a high value to achieve a rounded effect
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.4), // Shadow color with opacity
              blurRadius: 7, // Spread radius for the shadow
              offset: Offset(0, 3), // Offset of the shadow from the button
            ),
          ],
          color: Colors.red,
        ),
        child: Text(
          "SOS",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }

  _makeSOSDistressCall(String userId) async {
    var authToken = await getAuthToken();
    var response = await post(Uri.parse(Constant.sosCall + userId),
        body: null,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $authToken"
        });

    if (response.statusCode == 200) {
      Get.snackbar("Alert Received",
          "Thanks for alerting us, we request you to remain calm as we take appropriate action",
          snackPosition: SnackPosition.TOP);
      return true;
    } else {
      Get.snackbar('Error', 'Sorry, an error occurred while sending alert');
      return false;
    }
  }
}
