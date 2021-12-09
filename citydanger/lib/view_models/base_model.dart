/*=============== Owned packages ===================*/
import "package:citydanger/locator.dart";
import 'package:citydanger/models/marker_data_model.dart';
import 'package:citydanger/models/user_data_model.dart';
import 'package:citydanger/services/issue_service.dart';
import 'package:citydanger/services/media_service.dart';
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
  final MediaService mediaService = locator<MediaService>();
  final IssueService issueService = locator<IssueService>();
  final SnackbarService snackBarService = locator<SnackbarService>();
  final DialogService dialogService = locator<DialogService>();

  UserData getCurrentUser() {
    return authService.currentUser;
  }

  String get currentUserUid => getCurrentUser().uid;
  String get email => getCurrentUser().email;
  String get firstname => getCurrentUser().firstName;
  String get lasname => getCurrentUser().lastName;
}
