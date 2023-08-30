class OnlineFetch {
  static String fetchMessages = """
    subscription OnGetMessage {
    onGetMessage {
      id
      to
      from
      message
      topic
      dateSend 
    }
  }

""";
}
