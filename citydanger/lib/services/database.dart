import 'package:citydanger/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference<Map<String, dynamic>> _users =
      FirebaseFirestore.instance.collection("Users");
  Future<void> updateUserData(Map<String, dynamic> inputs) async {
    try {
      await _users.doc(inputs["Uid"]).set(inputs);
    } catch (e) {
      print(e);
    }
  }

  Future<UserData> getUser(String uid) async {
    try {
      //final StorageService storageService = locator<StorageService>();
      DocumentSnapshot<Map<String, dynamic>> data = await _users.doc(uid).get();
      Map<String, dynamic>? data1 = data.data();
      data1 ??= <String, dynamic>{};
      // String? coverUrl;
      // String? profileUrl =
      //     await storageService.getPictureUrl(data1["ProfileUrl"]);

      if (data1.isNotEmpty) {
        return UserData.fromUserData(data1);
      }
    } catch (e) {
      print(e.toString());
    }

    throw 'Some err';
  }
}
