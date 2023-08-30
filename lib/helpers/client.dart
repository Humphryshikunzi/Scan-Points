import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/components/messages/preferences.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/helpers/Constant.dart';  

class Config {
  static final HttpLink httpLink = HttpLink(
    Constant.mainUrl,
  );

  static final WebSocketLink websocketLink = WebSocketLink(
    Constant.webSocketUrl,
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      delayBetweenReconnectionAttempts: Duration(milliseconds: 100),
    ),
  );

  static ValueNotifier<GraphQLClient> initailizeClient() {
    MessagePreference _messagePreference = Get.find<MessagePreference>();
    AccountController _accountController = Get.find<AccountController>();
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: websocketLink,
      ),
    );

    final subscriptionDocument = gql(
      r'''
    subscription getMessages{
  onGetMessage {
    message
    from
    to
    topic
  }
}

  ''',
    );

    if (_accountController.isLoggedIn.isTrue) {
      var subscription = client.value.subscribe(
        SubscriptionOptions(document: subscriptionDocument),
      );
      subscription.listen((result) {
        if (result.data!['onGetMessage']['to'] ==
            _accountController.userName.toString()) {
          _messagePreference.addChats(result.data);
        }
      });
    }

    return client;
  } 
}
