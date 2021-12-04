/*=============== Owned packages ===================*/
import 'package:citydanger/services/login_service.dart';
import 'package:citydanger/services/auth_service.dart';
import 'package:citydanger/services/notification_service.dart';
import 'package:citydanger/services/database.dart';
/*=============== Extern packages ==================*/
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  locator.registerLazySingleton(() => NavigationService());
  locator
      .registerLazySingleton(() => PushNotificationService(_firebaseMessaging));
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => DatabaseService());
}
