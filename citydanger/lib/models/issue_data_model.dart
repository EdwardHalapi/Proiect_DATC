class IssueDataModel {
  String senderUid;
  String description;
  String image;
  String imageLocalUrl;
  int priority;
  String state;
  int longitutde;
  int latitude;

  IssueDataModel(
      {required this.senderUid,
      required this.description,
      required this.image,
      required this.imageLocalUrl,
      required this.priority,
      required this.state,
      required this.longitutde,
      required this.latitude});
  static IssueDataModel fromMap(
      Map<String, dynamic> map, String image, String imageLocalUrl) {
    if (map.isEmpty) {
      print("NOT GOOD");
    }
    return IssueDataModel(
        senderUid: map["senderUid"],
        description: map["description"],
        image: image,
        imageLocalUrl: imageLocalUrl,
        priority: map["priority"],
        state: map["state"],
        longitutde: map["longitude"],
        latitude: map["latitude"]);
  }
}
