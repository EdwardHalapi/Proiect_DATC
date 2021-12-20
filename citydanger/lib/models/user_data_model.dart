class UserData {
  String uid;
  String email;
  String firstName;
  String lastName;
  int rewardPoints;
  UserData(
      this.uid, this.email, this.firstName, this.lastName, this.rewardPoints);

  UserData.fromUserData(Map<String, dynamic> data)
      : uid = data["Uid"],
        email = data["email"],
        firstName = data["firstName"],
        lastName = data["lastName"],
        rewardPoints = data["rewardPoints"];
  Map<String, dynamic> get map {
    return {
      "Uid": _uid,
      "email": _email,
      "firstName": _firstName,
      "lastName": _lastName,
      "rewardPoints": _rewardPoints,
    };
  }

  Map<String, dynamic> get mapUserDataData {
    return {
      "Uid": uid,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
    };
  }

  set _uid(_uid) => uid = _uid;
  set _email(_email) => email = _email;
  set _firstName(_firstName) => firstName = _firstName;
  set _lastName(_lastName) => lastName = _lastName;
  set _rewardPoints(_rewardPoints) => rewardPoints = _rewardPoints;

  String get _uid => uid;
  String get _email => email;
  String get _firstName => firstName;
  String get _lastName => lastName;
  int get _rewardPoints => rewardPoints;
}
