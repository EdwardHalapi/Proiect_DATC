
class IssueDataModel {
  String senderUid;
  String description;
  String image;
  int priority;
  String state;
  double longitude;
  double latitude;
  String issueId;
  
  IssueDataModel(
      {required this.senderUid,
      required this.description,
      required this.image,
      required this.priority,
      required this.state,
      required this.longitude,
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
        latitude: map["latitude"],
        longitude: map["longitude"],
        issueId: map["issueId"]);
  }
}
