import 'dart:io';

import 'package:citydanger/enums/dialog_type.dart';
import 'package:citydanger/enums/snackbar_type.dart';
import 'package:citydanger/services/auth_service.dart';
import 'package:citydanger/view_models/issue_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:citydanger/navi.router.dart';
import 'package:stacked_services/stacked_services.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';

void main() {
  group("HomeViewModelTest - ", () {
    setUp(() => registerServices());

    tearDown(() => unregisterServices());

    group("Handle upload and fetch issue - ", () {
      test("test upload issue positive", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        MockSnackbarService snackbarService = getAndRegisterSnackbarService();
        IssueViewModel issueModel = IssueViewModel();
        dynamic imageFile = File('abc');
        issueModel.uploadIssue("description", imageFile, 30.02, 10.12);
        verify(issueService.uploadIssue('GtfsBkcW0HRi9I913UNPKrBXfxh2',
                'description', imageFile, 0, 'Unvalidated', 30.02, 10.12))
            .called(1);
        expect(issueModel.getIssueList.length, 1);
        verifyNever(snackbarService.showCustomSnackBar(
            variant: SnackBarType.Error,
            duration: const Duration(seconds: 3),
            title: "Warrning",
            message: "You should add at least a description or an image"));
      });
      test("test upload multiple issues issue positive", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        MockSnackbarService snackbarService = getAndRegisterSnackbarService();
        IssueViewModel issueModel = IssueViewModel();
        dynamic imageFile = File('abc');
        for (int index = 0; index < 4; index++) {
          issueModel.uploadIssue(
              "description", imageFile, 30.02 + index, 10.12 + index);
        }

        verify(issueService.uploadIssue('GtfsBkcW0HRi9I913UNPKrBXfxh2',
                'description', imageFile, 0, 'Unvalidated', any, any))
            .called(4);
        verifyNever(snackbarService.showCustomSnackBar(
            variant: SnackBarType.Error,
            duration: const Duration(seconds: 3),
            title: "Warrning",
            message: "You should add at least a description or an image"));
      });
      test("test upload multiple issues issue negative, expect to fail", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        MockSnackbarService snackbarService = getAndRegisterSnackbarService();
        IssueViewModel issueModel = IssueViewModel();
        dynamic imageFile = File('abc');
        for (int index = 0; index < 4; index++) {
          issueModel.uploadIssue(
              "description", imageFile, 30.02 + index, 10.12 + index);
        }

        verify(issueService.uploadIssue('GtfsBkcW0HRi9I913UNPKrBXfxh2',
            'description', imageFile, 0, 'Unvalidated', any, any)).called(3);
        verifyNever(snackbarService.showCustomSnackBar(
            variant: SnackBarType.Error,
            duration: const Duration(seconds: 3),
            title: "Warrning",
            message: "You should add at least a description or an image"));
      });
      test("test upload issue without description", () async {
        MockIssueService issueService = getAndRegisterIssueService();
        MockSnackbarService snackbarService = getAndRegisterSnackbarService();
        IssueViewModel issueModel = IssueViewModel();

        dynamic imageFile = File('abc');

        issueModel.uploadIssue('', imageFile, 30.02, 10.12);

        verify(issueService.uploadIssue('GtfsBkcW0HRi9I913UNPKrBXfxh2', '',
                null, 0, 'Unvalidated', any, any))
            .called(1);
        verify(snackbarService.showCustomSnackBar(
                variant: SnackBarType.Error,
                duration: const Duration(seconds: 3),
                title: "Warrning",
                message: "You should add at least a description or an image"))
            .called(1);
      });
    });
  });
}
