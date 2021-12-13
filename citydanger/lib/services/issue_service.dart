/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
import 'package:citydanger/enums/snackbar_type.dart';
import 'package:citydanger/models/issue_data_model.dart';
/*=============== Extern packages ==================*/
import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IssueService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<IssueDataModel> _issueData = [];
  final SnackbarService snackbarService = locator<SnackbarService>();
  bool _hasMoreIssues = true;
  int issuesLimit = 3;
  DocumentSnapshot? _lastDocument;
  List<IssueDataModel> get issueData => _issueData;
  bool get hasMoreIssues => _hasMoreIssues;
  Future<String?> uploadImage(File imageFile, String uid) async {
    String? downloadUrl;

    TaskSnapshot snapshot = await _storage
        .ref()
        .child(uid)
        .child('Issues')
        .child(path.basename(imageFile.path))
        .putFile(imageFile);
    if (snapshot.state == TaskState.success) {
      downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
  }

  Future<void> uploadIssue(
    String uid,
    String description,
    File? imagePath,
    int priority,
    String state,
    double? longitutde,
    double? latitude,
  ) async {
    String? issueImagePath;
    String absPath;
    String getDownloadedImageUrl;
    if (imagePath != null) {
      absPath = path.basename(imagePath.path);
      issueImagePath = '/$uid/Issues/$absPath';
    }

    if (description.isEmpty || imagePath == null) {
      snackbarService.showCustomSnackBar(
          variant: SnackBarType.Error,
          duration: const Duration(seconds: 3),
          title: "Warrning",
          message: "You should add at least a description or an image");
    } else {
      getDownloadedImageUrl = (await uploadImage(imagePath, uid)) ?? '';
      DocumentReference allIssueRef = _firestore.collection('Issues').doc();
      try {
        allIssueRef.set({
          'senderUid': uid,
          'description': description,
          'image': issueImagePath,
          'priority': priority,
          'state': state,
          'longitude': longitutde,
          'latitude': latitude,
          'issueId': allIssueRef.id,
        });
      } catch (error) {
        print("Error adding document:$error ");
      }
      _issueData.insert(
          0,
          IssueDataModel.fromMap({
            'senderUid': uid,
            'description': description,
            'priority': priority,
            'state': state,
            'longitude': longitutde,
            'latitude': latitude,
            'issueId': allIssueRef.id,
          }, getDownloadedImageUrl));
    }
  }

  Future<void> getAllIssues() async {
    dynamic data1;
    QuerySnapshot? response;
    Query? queryCred;
    CollectionReference refCertification = _firestore.collection("Issues");
    queryCred = refCertification.limit(6);
    String issueDownloadUrl = '';

    if (_lastDocument != null) {
      queryCred = queryCred
          .startAfterDocument(_lastDocument as DocumentSnapshot<Object?>);
    }
    if (!_hasMoreIssues) {
      return;
    } else {
      response = await queryCred.get();
      if (response.docs.isNotEmpty) {
        for (data1 in response.docs) {
          try {
            issueDownloadUrl =
                (await _storage.ref(data1.data()['image']).getDownloadURL())
                    .toString();
          } catch (error) {
            snackbarService.showCustomSnackBar(
                variant: SnackBarType.Error,
                duration: const Duration(seconds: 3),
                title: "Error",
                message: error.toString());
          }
          _issueData
              .add(IssueDataModel.fromMap(data1.data(), issueDownloadUrl));
        }
        _hasMoreIssues = response.docs.length == issuesLimit;
        _lastDocument = response.docs.last;
      } else {
        _hasMoreIssues = false;
      }
    }
  }
}
