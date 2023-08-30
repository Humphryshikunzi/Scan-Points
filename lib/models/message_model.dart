class Message_Model {
  String? id;
  String? name;
  String? subTitle;
  String? time;
  String? profile;
  String? counter;
  String? status;
  String? imgurl;
  String? hash;

  Message_Model({
    this.id,
    this.name,
    this.subTitle,
    this.time,
    this.profile,
    this.counter,
    this.status,
    this.imgurl,
    this.hash,
  });
}

List<Message_Model> messageList = [
  Message_Model(
    id: "1",
    name: "Cyen Lab",
    subTitle: "Sent you a message",
    time:
        DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
    profile: "assets/images/drivinglicence.png",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_d.jpg?alt=media&token=a7ec8770-fe49-4587-83d1-2241efe6cf1f",
    hash: "LMO:a,~UIVIB-=9Gx[WB4oM{IV%L",
    counter: "1",
    status: "on",
  ),
];
