/*=============== Owned packages ===================*/
import 'package:citydanger/models/issue_data_model.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/

class HomePageViewModel extends BaseModel {
  bool issueBusy = false;
  List<IssueDataModel> get getIssueList => issueService.issueData;
  Future<void> disposeViewModel() async {
    await authService.signOut();
  }

  Future<void> getIssues() async {
    issueBusy = true;
    await issueService.getAllIssues();
    issueBusy = false;
    notifyListeners();
  }
}
