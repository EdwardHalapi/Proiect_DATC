/*=============== Owned packages ===================*/
import "package:citydanger/locator.dart";
import 'package:citydanger/models/user_data_model.dart';
import 'package:citydanger/services/notification_service.dart';
import 'package:citydanger/services/auth_service.dart';

/*=============== Extern packages ==================*/
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final PushNotificationService notificationService =
      locator<PushNotificationService>();
  final AuthService authService = locator<AuthService>();

  UserData getCurrentUser() {
    return authService.currentUser;
  }

  String get currentUserUid => getCurrentUser().uid;
  String get fullName => getCurrentUser().email;
  String get coverUrl => getCurrentUser().firstName;
  String get localProfileImagePath => getCurrentUser().lastName;
}
