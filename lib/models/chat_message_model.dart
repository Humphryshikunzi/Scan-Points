class ChatMessage {
  String? messageContent;
  String? messageType;
  String? time;

  ChatMessage({this.messageContent, this.messageType, this.time});
}

List<ChatMessage> chatList = [
  ChatMessage(
      messageContent: "I'm Great, is your car fully booked.",
      messageType: "sender",
      time: "11:12 AM"),
];
