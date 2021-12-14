/*=============== Owned packages ===================*/
import 'package:citydanger/models/issue_data_model.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageViewModel extends BaseModel {
  bool issueBusy = false;
  Set<Marker> markers = {};
  Set<Marker> get getMarkers => markers;
  List<IssueDataModel> get getIssueList => issueService.issueData;
  Future<void> disposeViewModel() async {
    await authService.signOut();
  }

  Future<Set<Marker>> getmarkers() async {
    await getIssues();
    IssueDataModel issue;
    for (issue in getIssueList) {
      if (issue.state == "Validated") {
        markers.add(Marker(
            markerId:
                MarkerId(LatLng(issue.latitude, issue.longitude).toString()),
            position: LatLng(issue.latitude, issue.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: issue.description)));
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
}
