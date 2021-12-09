
class IssueDataModel {
  String senderUid;
  String description;
  String image;
  int priority;
  String state;
  double longitutde;
  double latitude;
  String issueId;
  
  IssueDataModel(
      {required this.senderUid,
      required this.description,
      required this.image,
      required this.priority,
      required this.state,
      required this.longitutde,
      required this.latitude,
      required this.issueId});
  static IssueDataModel fromMap(Map<String, dynamic> map, String image) {
    if (map.isEmpty) {
      print("NOT GOOD");
    }
    return IssueDataModel(
        senderUid: map["senderUid"],
        description: map["description"],
        image: image,
        priority: map["priority"],
        state: map["state"],
        longitutde: map["longitude"],
        latitude: map["latitude"],
        issueId: map["issueId"]);
  }
}
