/*=============== Owned packages ===================*/
import 'package:citydanger/models/issue_data_model.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/
import 'dart:io';

class IssueViewModel extends BaseModel {
  bool issueBusy = false;
  List<IssueDataModel> get getIssueList => issueService.issueData;
  File? _imageIssue;
  Future<File?> pickCertificaitonPhoto() async {
    _imageIssue = await mediaService.pickImageCertification();
    notifyListeners();
    return _imageIssue;
  }

  Future<void> uploadIssue(
    String description,
    File? imagePath,
    double? longitude,
    double? latitude,
  ) async {
    setBusy(true);
    await issueService.uploadIssue(currentUserUid, description, imagePath, 0,
        'Unvalidated', longitude ?? 0.0, latitude ?? 0.0);
    setBusy(false);
    notifyListeners();
  }

  Future<void> getIssues() async {
    issueBusy = true;
    await issueService.getAllIssues();
    issueBusy = false;
    notifyListeners();
  }
}
