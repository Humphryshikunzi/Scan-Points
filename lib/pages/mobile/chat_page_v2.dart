import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pamride/components/messages/preferences.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:http/http.dart' as http;
import 'package:pamride/widgets/user_utlities.dart';
import 'package:uuid/uuid.dart';
import '../../components/messages/data.dart';
import 'message_page.dart';

final addChartMutation = gql('''
  mutation AddChart(\$chartMsg: ChartInput!) {
    addChart(chartMsg: \$chartMsg) {
      id
      from
      to
      message
      topic
      dateSend
    }
  }
''');

final onGetMessageSubscription = gql('''
  subscription OnGetMessage {
    onGetMessage {
      id
      from
      to
      message
      topic
      dateSend
    }
  }
''');

class ChatPageV2 extends StatefulWidget {
  final String fromUser;
  final String toUser;
  final String? deviceRegistrationToken;

  ChatPageV2(
      {required this.fromUser,
      required this.toUser,
      required this.deviceRegistrationToken});

  @override
  _ChatPageV2State createState() => _ChatPageV2State();
}

class _ChatPageV2State extends State<ChatPageV2> {
  final TextEditingController _textEditingController = TextEditingController();
  MessagePreference _messagePreference = Get.find<MessagePreference>();
  ClientController _clientController = Get.find<ClientController>();
  ScrollController _scrollController = ScrollController();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  late Future<List<Chat>?> chats;
  List<Chat>? chatMessages;

  @override
  void initState() {
    chats = fetchChats();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });

    analytics.setCurrentScreen(screenName: 'Chat Page');
  }

  @override
  void dispose() {
    _messagePreference.updateMessageCount(widget.toUser, true);
    super.dispose();
  }

  String prevDate() {
    String prevUserDate = "";
    int index = _messagePreference.individualMessageLength.value - 1;
    dynamic message;
    while (index > 0) {
      message =
          jsonDecode(_messagePreference.getChats(isIndividual: true)![index]);
      if (message["from"] == widget.toUser) {
        prevUserDate = message["dateSend"];
        break;
      }
      index--;
    }
    return prevUserDate.replaceAll("\"", "");
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

  Future<List<Chat>?> fetchChats() async {
    try {
      String from = widget.toUser;
      String to = widget.fromUser;
      String dateSend = prevDate();
      String uri = 'https://api.pamride.com/api/chats/$from/$to/$dateSend';
      String token = await getAuthToken();

      // Set the Authorization header with the token
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      final response = await http.get(Uri.parse(uri), headers: headers);

      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Chat> chats =
            List<Chat>.from(l.map((model) => Chat.fromJson(model)));
        setState(() {
          chatMessages = chats;
        });
        return chats;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

// Rest of your code...

  void _sendMessage(String messageText) async {
    var messageId = Uuid().v4();
    final sendMessageRequest = GAddChatReq((b) => b
      ..vars.message = messageText
      ..vars.to = widget.toUser
      ..vars.from = widget.fromUser
      ..vars.id = messageId
      ..vars.topic = "New message"
      ..vars.deviceRegToken = widget.deviceRegistrationToken);
    _textEditingController.clear();
    _clientController.client.request(sendMessageRequest).listen((event) {
      if (event.data != null && event.data?.addChart.message != null) {
        Map<String, dynamic> sentMessage = {
          'onGetMessage': {
            '__typename': 'Chart',
            'id': event.data?.addChart.id,
            'to': event.data?.addChart.to,
            'from': event.data?.addChart.from,
            'message': event.data?.addChart.message,
            'topic': event.data?.addChart.topic,
            'deviceRegToken': event.data?.addChart.deviceRegToken,
            'dateSend':
                DateTime.now().toString() //event.data?.addChart.dateSend,
          },
        };
        setState(() {
          _messagePreference.addChats(sentMessage);
          _messagePreference.addIndividualChats(sentMessage);
        });

        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 100,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut); 
      }
    });

    analytics
        .logEvent(name: 'send_message', parameters: {'message': messageText});
  }

  @override
  Widget build(BuildContext context) {
    if (chatMessages != null) {
      for (var chat in chatMessages!) {
        DateTime dateMessageSent =
            DateTime.parse(chat.dateSend.toString()).toLocal();
        String encodedDateTime = jsonEncode(dateMessageSent.toIso8601String());
        Map<String, dynamic> sentMessage = {
          'onGetMessage': {
            '__typename': 'Chart',
            'id': chat.id,
            'to': chat.to,
            'from': chat.from,
            'message': chat.message,
            'topic': chat.topic,
            'dateSend': encodedDateTime
          },
        };
        setState(() {
          _messagePreference.addIndividualChats(sentMessage);
        });
        analytics.logEvent(
            name: 'receive_message', parameters: {'message': chat.message});
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 100,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut);
      }
    }

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: ColorsRes.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Chat with: ${widget.toUser}',
            style: TextStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Subscription(
                  options: SubscriptionOptions(
                      document: gql(OnlineFetch.fetchMessages)),
                  builder: (result) {
                    if (result.hasException) {
                      Fluttertoast.showToast(
                          msg:
                              "There is an error with the app!\n Go to previous page before opening this page again",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: ColorsRes.black,
                          textColor: ColorsRes.white,
                          fontSize: 16.0);
                      return Container();
                    }

                    if (_messagePreference.getChats(isIndividual: true) ==
                            null &&
                        result.isLoading) {
                      return Expanded(
                        child: Center(
                          child: NotFoundPlaceHolder(
                            message: "No messages here yet",
                          ),
                        ),
                      );
                    }

                    if (result.data != null) {
                      if (result.data!['onGetMessage']['to'] ==
                              widget.fromUser &&
                          result.data!['onGetMessage']['from'] ==
                              widget.toUser) {
                        _messagePreference.addIndividualChats(result.data!);
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent + 100,
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOut); 
                      }
                    }

                    return Expanded(
                      child: Obx(() {
                        return ListView.builder(
                            controller: _scrollController,
                            itemCount: _messagePreference
                                .individualMessageLength.value,
                            itemBuilder: (context, index) {
                              final message = jsonDecode(_messagePreference
                                  .getChats(isIndividual: true)![index]);
                              final isSent = message['from'] == widget.fromUser;
                              final dateMessage =
                                  dateMessageSent(message["dateSend"]);

                              if ((message["from"] == widget.fromUser ||
                                      message["to"] == widget.fromUser) &&
                                  (message["to"] == widget.toUser ||
                                      message["from"] == widget.toUser)) {
                                return Visibility(
                                  visible: true,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 16),
                                      alignment: isSent
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: isSent
                                                  ? Radius.circular(10)
                                                  : Radius.circular(0),
                                              bottomRight: isSent
                                                  ? Radius.circular(0)
                                                  : Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            color: isSent
                                                ? ColorsRes.green
                                                : Colors.white60,
                                            gradient: isSent
                                                ? LinearGradient(
                                                    colors: [
                                                      Colors.orange.shade200,
                                                      Colors.orange,
                                                    ],
                                                  )
                                                : LinearGradient(
                                                    colors: [
                                                      ColorsRes.grayColor,
                                                      ColorsRes.white,
                                                    ],
                                                  ),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 0.3)),
                                        padding: EdgeInsets.all(16),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: message['message'],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: isSent
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "\n\n$dateMessage",
                                                style: TextStyle(
                                                  fontSize:
                                                      12, // smaller font size for date message
                                                  color: isSent
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontWeight: FontWeight
                                                      .w300, // lighter font weight
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                              } else {
                                return Visibility(
                                  visible: false,
                                  child: Container(),
                                );
                              }
                            });
                      }),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _textEditingController,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: ColorsRes.green,
                          ),
                          onPressed: () {
                            _sendMessage(_textEditingController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chat {
  String? id;
  String? from;
  String? to;
  DateTime? dateSend;
  String? message;
  String? topic;
  DateTime? updated;
  Duration? updatedAt;

  Chat(
      {this.id,
      this.from,
      this.to,
      this.dateSend,
      this.message,
      this.topic,
      this.updated,
      this.updatedAt});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['Id'],
      from: json['From'],
      to: json['To'],
      dateSend: DateTime.parse(json['DateSend']).toLocal(),
      message: json['Message'],
      topic: json['Topic'],
      // updated: DateTime.parse(json['Updated']),
      // updatedAt:
      //     Duration(milliseconds: int.parse(json['UpdatedAt'].split('.')[1])),
    );
  }
}
