/*=============== Owned packages ===================*/
import "package:citydanger/locator.dart";
import 'package:citydanger/services/login_service.dart';
import 'package:citydanger/services/notification_service.dart';
import 'package:citydanger/services/signUP_service.dart';

/*=============== Extern packages ==================*/
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final PushNotificationService notificationService =
      locator<PushNotificationService>();
  //final SignUpService signUpServices = locator<SignUpService>();
  //final LoginService loginService = locator<LoginService>();
}
