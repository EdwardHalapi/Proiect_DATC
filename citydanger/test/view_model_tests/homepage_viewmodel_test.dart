import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';

void main() {
  group("HomeViewModelTest - ", () {
    setUp(() => registerServices());

    tearDown(() => unregisterServices());

    group("Handle Issue fetching Logic - ", () {
      test("Test if fetching issues works positive", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        HomePageViewModel homeModel = HomePageViewModel();
        homeModel.getIssues();
        verify(issueService.getAllIssues()).called(1);
        expect(homeModel.getIssueList.length, 1);
      });
      test("Test if fetching issues works negative", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        HomePageViewModel homeModel = HomePageViewModel();
        verifyNever(issueService.getAllIssues());
      });
      test("Test if markers sets", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        HomePageViewModel homeModel = HomePageViewModel();
        homeModel.getmarkers();
        verify(issueService.getAllIssues()).called(1);
        expect(homeModel.getIssueList.length, 1);
        expect(homeModel.markers.length, 1);
      });
      test("Test disposing viewModel", () async {
        MockAuthService authService = getAndRegisterAuthService();
        HomePageViewModel homeModel = HomePageViewModel();
        homeModel.disposeViewModel();
        verify(authService.signOut()).called(1);
      });

      // test("Test state change", () async {
      //   MockIssueService issueService = getAndRegisterIssueService();
      //   MockDialogService dialogService = getAndRegisterDialogService();
      //   HomePageViewModel homeModel = HomePageViewModel();
      //   homeModel.showCustomDialog("any", "any", "any", 0, "any");
      //   verify(issueService.changeState("any", "dadsadas", "any", 0, "any"))
      //       .called(1);
      // });
    });
  });
}
