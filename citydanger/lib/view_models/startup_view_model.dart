/*=============== Owned packages ===================*/
import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/

class StartupViewModel extends BaseModel {
  Future<void> handleStartUpLogic() async {
    bool result = await authService.isUserLoggedIn();
    print(result);
    if (result == true) {
      navigationService.navigateTo(Routes.homePage);
    } else {
      navigationService.navigateTo(Routes.loginScreen);
    }
  }
}
