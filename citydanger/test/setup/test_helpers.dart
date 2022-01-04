/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
import 'package:citydanger/models/issue_data_model.dart';
import 'package:citydanger/models/user_data_model.dart';
import 'package:citydanger/services/auth_service.dart';
import 'package:citydanger/services/database.dart';
import 'package:citydanger/services/issue_service.dart';
import 'package:citydanger/services/media_service.dart';
import 'package:citydanger/services/notification_service.dart';
import 'package:citydanger/services/permission_service.dart';
/*=============== Extern packages ==================*/
import 'dart:async';
import 'dart:io';
import 'test_helpers.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@GenerateMocks([], customMocks: [
  MockSpec<MediaService>(returnNullOnMissingStub: true),
  MockSpec<SnackbarService>(returnNullOnMissingStub: true),
  MockSpec<AuthService>(returnNullOnMissingStub: true),
  MockSpec<DatabaseService>(returnNullOnMissingStub: true),
  MockSpec<DialogService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<BottomSheetService>(returnNullOnMissingStub: true),
  MockSpec<IssueService>(returnNullOnMissingStub: true),
  MockSpec<PermissionService>(returnNullOnMissingStub: true),
  MockSpec<PushNotificationService>(returnNullOnMissingStub: true),
])
MockBottomSheetService getAndRegisterBottomSheetService() {
  _removeRegistrationIfExists<BottomSheetService>();
  Map<dynamic, dynamic> data = {
    "title": "Thanks for the notice!",
    "confirmButtonTitle": "Ok",
    "description":
        "Our team will investigate. If the review is not compliant with our Terms & Conditions will be deleted."
  };
  final service = MockBottomSheetService();
  when(
    service.showBottomSheet(
      title: data['title'],
      confirmButtonTitle: data["confirmButtonTitle"],
      description: data["description"],
    ),
  ).thenAnswer((realInvocation) => Future.value());
  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockMediaService getAndRegisterMediaService({bool result = false}) {
  _removeRegistrationIfExists<MediaService>();
  final service = MockMediaService();
  when.call(service.pickImageCertification()).thenAnswer(
        (_) => result == true
            ? Future.value(
                File('abc'),
              )
            : Future.value(null),
      );
  locator.registerSingleton<MediaService>(service);
  return service;
}

MockSnackbarService getAndRegisterSnackbarService() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService(
    {UserData? currentUser, bool isFalse = false}) {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  when(service.currentUser).thenReturn(currentUser ??
      UserData('GtfsBkcW0HRi9I913UNPKrBXfxh2', 'halaed@gmail.com', 'Edward',
          'Halapi', 10));
  when(service.signOut()).thenAnswer(
    (_) {
      if (isFalse == true) {
        return Future.value(true);
      }

      return Future.value(null);
    },
  );
  locator.registerSingleton<AuthService>(service);

  return service;
}

MockDatabaseService getAndRegisterDatabaseService() {
  _removeRegistrationIfExists<DatabaseService>();
  final service = MockDatabaseService();
  locator.registerSingleton<DatabaseService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockPermissionService getAndRegisterPermissionService() {
  _removeRegistrationIfExists<PermissionService>();
  final service = MockPermissionService();
  locator.registerSingleton<PermissionService>(service);
  return service;
}

MockIssueService getAndRegisterIssueService({List<IssueDataModel>? issueData}) {
  _removeRegistrationIfExists<IssueService>();
  final service = MockIssueService();
  when(service.issueData).thenReturn(issueData ??
      [
        IssueDataModel(
            senderUid: 'GtfsBkcW0HRi9I913UNPKrBXfxh2',
            description: 'description',
            image: 'image',
            priority: 1,
            state: 'Validated',
            longitude: 10.02,
            latitude: 30.03,
            issueId: 'Avniah767HHfdDS')
      ]);
  locator.registerSingleton<IssueService>(service);
  return service;
}

MockPushNotificationService getAndRegisterNotificationService() {
  _removeRegistrationIfExists<PushNotificationService>();
  final service = MockPushNotificationService();
  locator.registerSingleton<PushNotificationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterMediaService();
  getAndRegisterSnackbarService();
  getAndRegisterAuthService();
  getAndRegisterDatabaseService();
  getAndRegisterDialogService();
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterIssueService();
  getAndRegisterPermissionService();
  getAndRegisterNotificationService();
}

void unregisterServices() {
  locator.unregister<MediaService>();
  locator.unregister<SnackbarService>();
  locator.unregister<AuthService>();
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<DatabaseService>();
  locator.unregister<BottomSheetService>();
  locator.unregister<PermissionService>();
  locator.unregister<IssueService>();
  locator.unregister<PushNotificationService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
