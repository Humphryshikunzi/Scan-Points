import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pamride/pages/mobile/chat_page_v2.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MessagePreference extends GetxController {
  late SharedPreferences _prefs;

  RxInt messageLength = 0.obs;
  RxInt individualMessageLength = 0.obs;

  List<String>? getChats({bool isIndividual = false}) {
    List<String>? existingMessages = _prefs.getStringList("messages");
    List<String>? existingIndividualMessages =
        _prefs.getStringList("individualMessages");

    if (existingMessages != null) {
      messageLength = existingMessages.length.obs;
    }

    if (existingIndividualMessages != null) {
      individualMessageLength = existingIndividualMessages.length.obs;
    }

    return isIndividual ? existingIndividualMessages : existingMessages;
  }

  List<String>? getIndividualChats({bool isIndividual = false}) {
    List<String>? existingIndividualMessages =
        _prefs.getStringList("individualMessages");

    if (existingIndividualMessages != null) {
      individualMessageLength = existingIndividualMessages.length.obs;

      if (individualMessageLength.value > 1) {
        existingIndividualMessages.sort((a, b) {
          Map<String, dynamic> message1 = jsonDecode(a);
          Map<String, dynamic> message2 = jsonDecode(b);
          DateTime dateSend1;
          DateTime dateSend2;

          try {
            dateSend1 = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS")
                .parse(message1['dateSend'].toString().replaceAll("\"", ""));
            dateSend2 = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS")
                .parse(message2['dateSend'].toString().replaceAll("\"", ""));
          } catch (e) {
            dateSend1 = DateTime.parse(
                message1['dateSend'].toString().replaceAll("\"", ""));
            dateSend2 = DateTime.parse(
                message2['dateSend'].toString().replaceAll("\"", ""));
          }

          return dateSend2.compareTo(dateSend1);
        });
      }
    }

    return existingIndividualMessages;
  }

  List<String>? addChats(Map<String, dynamic>? message, {isSender = false}) {
    String encodedMessage = jsonEncode(message!['onGetMessage']);
    List<String>? existingMessages = _prefs.getStringList("messages");

    if (existingMessages != null) {
      bool newChat = true;

      for (int i = 0; i < existingMessages.length; i++) {
        Map<String, dynamic>? message2 = jsonDecode(existingMessages[i]);

        if (message2!['from'] == message['onGetMessage']['from']) {
          newChat = false;
          isSender
              ? message2['chats']
                  .add({"sender": message['onGetMessage']['message']})
              : message2['chats']
                  .add({"receiver": message['onGetMessage']['message']});
          Map<String, dynamic> message2Temp = message2;
          encodedMessage = jsonEncode(message2);
          existingMessages[i] = jsonEncode(message2Temp);

          break;
        }
      }
      if (newChat) {
        Map<String, dynamic>? message3 = {
          "id": message['onGetMessage']['id'],
          "from": message['onGetMessage']['from'],
          "to": message['onGetMessage']['to'],
          "topic": message['onGetMessage']['topic'],
          "message": message['onGetMessage']['message'],
          "dateSend": message['onGetMessage']['dateSend'],
          "chats": []
        };
        isSender
            ? message3['chats'].add({"sender": message3['message']})
            : message3['chats'].add({"receiver": message3['message']});
        encodedMessage = jsonEncode(message3);
        existingMessages.add(encodedMessage);
      }
      _prefs.setStringList("messages", existingMessages);
    } else {
      message = {
        "id": message['onGetMessage']['id'],
        "from": message['onGetMessage']['from'],
        "to": message['onGetMessage']['to'],
        "topic": message['onGetMessage']['topic'],
        "message": message['onGetMessage']['message'],
        "dateSend": message['onGetMessage']['dateSend'],
        "chats": []
      };
      List<String>? newList = [];
      isSender
          ? message['chats'].add({"sender": message['message']})
          : message['chats'].add({"receiver": message['message']});
      encodedMessage = jsonEncode(message);
      newList.add(encodedMessage);
      _prefs.setStringList("messages", newList);
    }

    List<String>? newMessages = _prefs.getStringList("messages");
    messageLength = newMessages!.length.obs;
    addIndividualChats(message);

    return newMessages;
  }

  List<String> addIndividualChats(Map<String, dynamic> message) {
    if (message["onGetMessage"] != null) {
      message = message['onGetMessage'];
    }

    String encodedMessage = jsonEncode(message);
    List<String>? existingMessages = _prefs.getStringList("individualMessages");

    if (existingMessages != null) {
      // Check if the message is new or not and if the difference between the last message is more than 5 seconds,
      // to avoid spamming or duplicate messages in sequence
      String sender = message['from'];
      String receiver = message['to'];
      String content = message['message'];
      String messageId = message['id'];

      for (int i = existingMessages.length - 1; i >= 0; i--) {
        Map<String, dynamic> messagesData = jsonDecode(existingMessages[i]);
        if (messagesData["id"] == messageId &&
            messagesData["from"] == sender &&
            messagesData["to"] == receiver) {
          return existingMessages;
        }
      }

      Map<String, dynamic> newMessage = {
        "id": message['id'],
        "from": sender,
        "to": receiver,
        "topic": message['topic'],
        "message": content,
        "dateSend": message['dateSend'],
        "chats": []
      };
      newMessage['chats'].add({"receiver": content});
      existingMessages.add(jsonEncode(newMessage));

      _prefs.setStringList("individualMessages", existingMessages);
    } else {
      Map<String, dynamic>? messageToSave = {
        "id": message['id'],
        "from": message['from'],
        "to": message['to'],
        "topic": message['topic'],
        "message": message['message'],
        "dateSend": message['dateSend'],
        "chats": []
      };
      List<String>? newList = [];
      messageToSave['chats'].add({
        "receiver": message['message'],
      });
      encodedMessage = jsonEncode(messageToSave);
      newList.add(encodedMessage);
      _prefs.setStringList("individualMessages", newList);
    }

    List<String>? newMessages = _prefs.getStringList("individualMessages");
    individualMessageLength = newMessages!.length.obs;

    return newMessages;
  }

  Future<void> SyncMessages() async {
    try {
      // get messages sent to me when I was offline
      String dateSend = _prefs.getString("prevMessageDate") ??
          DateTime.now().subtract(Duration(days: 2)).toString();
      String to = _prefs.getString("username") ?? "";
      String uri = 'https://api.pamride.com/api/chats/$to/$dateSend';
      String token =
          await getAuthToken(); // Set the Authorization header with the token
      Map<String, String> headers = {'Authorization': 'Bearer $token'};

      final response = await http.get(Uri.parse(uri), headers: headers);

      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Chat> chats =
            List<Chat>.from(l.map((model) => Chat.fromJson(model)));

        chats.forEach((message) {
          DateTime dateMessageSent =
              DateTime.parse(message.dateSend.toString()).toLocal();
          String encodedDateTime =
              jsonEncode(dateMessageSent.toIso8601String());
          Map<String, dynamic> sentMessage = {
            'onGetMessage': {
              '__typename': 'Chart',
              'id': message.id,
              'to': message.to,
              'from': message.from,
              'message': message.message,
              'topic': message.topic,
              'dateSend': encodedDateTime
            },
          };
          addChats(sentMessage);
          addIndividualChats(sentMessage);
          updateMessageCount(message.from.toString(), false);
        });
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  void updateMessageCount(String to, bool reset) {
    // Retrieve the existing message counter list from preferences
    List<String>? existingMessages = _prefs.getStringList("messageCounter");

    // If no existing messages are found
    if (existingMessages == null) {
      existingMessages = [];
    }

    // Find the user in the existing messages list
    int userIndex = existingMessages.indexWhere((message) =>
        message.split(':')[0] ==
        to); // Assuming the message is stored in the format "username:count"

    // If the user is not found in the existing messages list
    if (userIndex == -1) {
      if (!reset) {
        // Add a new user with initial message count 1
        existingMessages.add('$to:1');
      }
    } else {
      // User already exists in the list
      String userMessage = existingMessages[userIndex];
      int messageCount = int.parse(userMessage.split(':')[1]);

      if (!reset) {
        // Increment the message count for the user
        messageCount++;
      } else {
        // Reset the message count to zero
        messageCount = 0;
      }

      // Update the user's message count in the list
      existingMessages[userIndex] = '$to:$messageCount';
    }

    // Save the updated message counter list to preferences
    _prefs.setStringList("messageCounter", existingMessages);
  }

  int getMessageCount(String username) {
    // Retrieve the existing message counter list from preferences
    List<String>? existingMessages = _prefs.getStringList("messageCounter");

    // If no existing messages are found or the username is not in the list, return 0
    if (existingMessages == null ||
        !existingMessages.any((message) => message.startsWith('$username:'))) {
      return 0;
    }

    // Find the user in the existing messages list
    String userMessage = existingMessages
        .firstWhere((message) => message.startsWith('$username:'));

    // Extract the message count for the user
    int messageCount = int.parse(userMessage.split(':')[1]);

    return messageCount;
  }

  void savePrevMessageDate() {
    DateTime now = DateTime.now();
    _prefs.setString("prevMessageDate", now.toString());
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
