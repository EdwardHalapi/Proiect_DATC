/*=============== Owned packages ===================*/
import 'package:citydanger/services/issue_service.dart';
import 'package:citydanger/services/login_service.dart';
import 'package:citydanger/services/auth_service.dart';
import 'package:citydanger/services/media_service.dart';
import 'package:citydanger/services/notification_service.dart';
import 'package:citydanger/services/database.dart';
import 'package:citydanger/services/permission_service.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';
import 'package:citydanger/view_models/issue_view_model.dart';
import 'package:citydanger/view_models/signUP_viewmodel.dart';
/*=============== Extern packages ==================*/
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  //registered Services
  locator.registerLazySingleton(() => NavigationService());
  locator
      .registerLazySingleton(() => PushNotificationService(_firebaseMessaging));
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => PermissionService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => IssueService());

  //registered ViewModels
  locator.registerLazySingleton(() => HomePageViewModel());
  locator.registerLazySingleton(() => IssueViewModel());
  locator.registerLazySingleton(() => SignUpViewModel());
}
