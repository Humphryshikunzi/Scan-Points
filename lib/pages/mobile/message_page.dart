import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pamride/components/messages/preferences.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/DesignConfig.dart';
import 'package:pamride/pages/mobile/chat_page_v2.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../components/messages/data.dart';
import 'login_page.dart';

class MessageActivity extends StatefulWidget {
  MessageActivity({Key? key}) : super(key: key);

  @override
  _MessageActivityState createState() => _MessageActivityState();
}

class _MessageActivityState extends State<MessageActivity> {
  AccountController _accountController = Get.find<AccountController>();
  MessagePreference _messagePreference = Get.find<MessagePreference>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  int chatCount = 0;
  List<String> images = [];
  List<String> deviceTokens = [];
  bool isOnline = false;
  bool isDbSynched = false;
  Map<String, dynamic> userMessages = {};
  bool isMessagesLoaded = false;

  @override
  void initState() {
    SynchDb();
    getUsersInfo();
    getUserRelatedInfo();
    analytics.setCurrentScreen(screenName: "Message Activity  Page");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _messagePreference
        .savePrevMessageDate(); // to be used to sync messages the next time user logis in
  }

  Future<void> SynchDb() async {
    // syncronize db here
    await _messagePreference.SyncMessages().then((value) => {
          setState(() {
            isDbSynched = true;
          })
        });
  }

  String dateMessageSent(String dateStrInput) {
    String dateStr = "";
    try {
      DateTime date = DateTime.parse(dateStrInput).toLocal();
      dateStr = DateFormat('h:mm a, d/M/yy').format(date);
    } catch (Ex) {
      return "";
    }
    return dateStr;
  }

  getUserRelatedInfo() async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: await getLinkAndToken(),
    );

    String userName = "";
    String userImg = "";
    List<String>? chats;
    try {
      chats = _messagePreference.getChats()!;
    } catch (e) {
      return;
    }
    int itemCount = chats.length;

    for (var i = 0; i < itemCount; i++) {
      Map<String, dynamic> decodedMessage = jsonDecode(chats[i]);
      userName = decodedMessage["from"];

      final MutationOptions options = MutationOptions(
        document: gql('''
      query {
    users(
      where: {
        userName: { eq: "$userName" } 
      }
    ) {
        profilePictureDataUrl 
        device {
        deviceRegToken
      }
    }
  }

    '''),
      );

      final QueryResult result = await client.mutate(options);
      if (result.hasException) {
        return;
      }
      String filePath = result.data?['users'][0]['profilePictureDataUrl'];
      userImg = filePath.substring(filePath.lastIndexOf("/") + 1);
      images.add(userImg);

      String deviceToken = result.data?['users'][0]['device'] != null
          ? result.data!['users'][0]['device']['deviceRegToken']
          : '';
      deviceTokens.add(deviceToken);

      setState(() {
        images = images;
        deviceTokens = deviceTokens;
      });
    }
  }

  Map<String, dynamic> getUsersInfo() {
    // Map to store last message and date for each user
    Map<String, dynamic> lastMessages = {};
    List<String>? data;
    try {
      data = _messagePreference.getIndividualChats()!;
    } catch (e) {
      return lastMessages;
    }

    for (String item in data) {
      Map<String, dynamic> jsonData = jsonDecode(item);
      String username = jsonData['from'];
      String message = jsonData['message'];
      String dateSend = jsonData['dateSend'];
      int messageCount = jsonData['messageCount'] ?? 0;

      // Update the last message and date for the user
      if (_accountController.userName.value == username) {
        username = jsonData['to'];
      }
      if (!lastMessages.containsKey(username)) {
        lastMessages[username] = {
          'message': message,
          'date': dateSend,
          'username': username,
          'messageCount': messageCount
        };
      }
    }

    setState(() {
      userMessages = lastMessages;
      isMessagesLoaded = true;
    });

    return lastMessages;
  }

  Widget notificationView() {
    return Subscription(
      options: SubscriptionOptions(document: gql(OnlineFetch.fetchMessages)),
      builder: (result) {
        if (result.hasException) {
          return Text("There was an error!");
        }

        if (_messagePreference.getChats() == null && result.isLoading) {
          return Center(
            child: NotFoundPlaceHolder(
              message: "No messages here yet",
            ),
          );
        }

        if (result.data != null) {
          if (result.data!['onGetMessage']['to'] ==
              _accountController.userName.toString()) {
            _messagePreference.addChats(result.data);
            _messagePreference.updateMessageCount(
                result.data!['onGetMessage']['from'], false);
          }
        }

        if (isDbSynched == false || isMessagesLoaded == false) {
          return Center(
              child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text("Loading messages...")
              ],
            ),
          ));
        }

        int usersCount = userMessages.length;

        if (usersCount == 0) {
          return Center(
            child: NotFoundPlaceHolder(
              message: "No messages here yet",
            ),
          );
        }

        return Obx(
          () {
            return ListView.builder(
              padding:
                  EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: usersCount.obs.value,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> decodedMessage =
                    userMessages.values.elementAt(usersCount - 1 - index);

                // ignore: unnecessary_null_comparison
                if (decodedMessage == null) {
                  return Container(
                    decoration:
                        DesignConfig.boxDecorationContainer(Colors.white, 10),
                    margin: EdgeInsets.only(bottom: 10),
                  );
                }

                String profileImge = "";
                String deviceRegToken = "";
                if (images.length == _messagePreference.messageLength.value) {
                  profileImge = images[index];
                  deviceRegToken = deviceTokens[index];
                }

                String userName = decodedMessage['username'];
                String message;
                if (decodedMessage['message'].length > 16) {
                  message = decodedMessage['message'].substring(0, 16) + "...";
                } else {
                  message = decodedMessage['message'];
                }
                String dateStr = decodedMessage['date'];
                int messageCount = _messagePreference.getMessageCount(userName);

                return Container(
                  decoration:
                      DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Stack(children: <Widget>[
                      new CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: Container(
                              color: Colors
                                  .grey, // Set the desired background color
                              child: Image.network(
                                getProfileImageUrl(profileImge),
                                fit: BoxFit.fill,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container();
                                },
                                width: 47,
                                height: 47,
                              ),
                            ),
                          )),

                      // change 'on' == 'off' to 'on' == 'on' to see the green dot showing online
                      "on" == "off"
                          ? Positioned(
                              right: 1,
                              top: 5,
                              child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: ColorsRes.green,
                                  child: ClipOval()),
                            )
                          : "" == "off"
                              ? Positioned(
                                  right: 1,
                                  top: 5,
                                  child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: ColorsRes.grayColor,
                                      child: ClipOval()),
                                )
                              : Positioned(
                                  right: 1,
                                  top: 5,
                                  child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.transparent,
                                      child: ClipOval()),
                                )
                    ]),
                    title: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(userName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                new Text(message,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.grayColor,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                messageCount > 0
                                    ? CircleAvatar(
                                        backgroundColor:
                                            ColorsRes.gradientTwoColor,
                                        radius: 10,
                                        child: ClipOval(
                                            child: Text(messageCount.toString(),
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: ColorsRes.white))))
                                    : CircleAvatar(
                                        backgroundColor: ColorsRes.white,
                                        radius: 10,
                                        child: ClipOval(
                                            child: Text(
                                                "messageList[index].counter!",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: ColorsRes.white)))),
                                SizedBox(height: 5),
                                Text(dateMessageSent(dateStr),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.grayColor,
                                    )),
                              ])
                        ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPageV2(
                            fromUser: _accountController.userName.string,
                            toUser: userName,
                            deviceRegistrationToken: deviceRegToken,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorsRes.backgroundColor,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Obx(() {
            return _accountController.isLoggedIn.value
                ? Stack(
                    children: <Widget>[
                      Container(
                        color: ColorsRes.white,
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              notificationView(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                          'Relax, when logged in you will be able to see your scan points history here'),
                    ),
                  );
          }),
        ),
        onWillPop: () async {
          return false;
        });
  }
}

class NotFoundPlaceHolder extends StatelessWidget {
  final String message;
  final double? iconHeight;

  const NotFoundPlaceHolder({
    Key? key,
    required this.message,
    this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Lottie.asset(
              'assets/assets/no-message.json',
              height: iconHeight ?? MediaQuery.of(context).size.height / 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
