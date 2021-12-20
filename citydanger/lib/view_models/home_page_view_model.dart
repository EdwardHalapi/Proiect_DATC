/*=============== Owned packages ===================*/
import 'package:citydanger/enums/dialog_type.dart';
import 'package:citydanger/models/issue_data_model.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageViewModel extends BaseModel {
  bool issueBusy = false;
  Set<Marker> markers = {};
  Set<Marker> get getMarkers => markers;
  bool get hasMoreIssues => issueService.hasMoreIssues;
  List<IssueDataModel> get getIssueList => issueService.issueData;
  Future<void> disposeViewModel() async {
    await authService.signOut();
  }

  Future<Set<Marker>> getmarkers() async {
    await getIssues();
    IssueDataModel issue;
    for (issue in getIssueList) {
      if (issue.state == "Validated") {
        markers.add(
          Marker(
              markerId:
                  MarkerId(LatLng(issue.latitude, issue.longitude).toString()),
              position: LatLng(issue.latitude, issue.longitude),
              icon: BitmapDescriptor.defaultMarker,
              onTap: () async {
                await showCustomDialogMarker(issue.image, issue.description);
              }),
        );
      }
    }
    notifyListeners();
    return markers;
  }

  Future<void> getIssues() async {
    issueBusy = true;
    await issueService.getAllIssues();
    issueBusy = false;
    notifyListeners();
  }

  Future<void> showCustomDialog(String issueImageUrl, String description,
      String issueId, int index,String userId) async {
    dynamic isOkFlag;
    isOkFlag = await dialogService.showCustomDialog(
      secondaryButtonTitle: 'Unvalidate',
      description: description,
      variant: DialogType.ShowIssueAdmin,
      mainButtonTitle: 'Validate',
      imageUrl: issueImageUrl,
    );
    print("FLAG:" + isOkFlag.data.toString());
    await issueService.changeState(issueId, isOkFlag.data.toString(),
        issueImageUrl, index, userId);
    notifyListeners();
  }

  Future<void> showCustomDialogMarker(
      String issueImageUrl, String description) async {
    await dialogService.showCustomDialog(
      description: description,
      variant: DialogType.ShowIssueUser,
      imageUrl: issueImageUrl,
      mainButtonTitle: 'OK',
    );
    notifyListeners();
  }
}
