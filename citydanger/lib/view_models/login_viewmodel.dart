// ignore_for_file: file_names
/*=============== Owned packages ===================*/
import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/

class LoginViewModel extends BaseModel {
  Future<void> login(String email, String password) async {
    bool result = false;
    setBusy(true);
    result = await authService.signIn(email, password);
    setBusy(false);
    if (result == true) {
      navigationService.navigateTo(Routes.homePage);
    }
  }

  Future<void> loginAdmin(String code) async {
    bool result = false;

    setBusy(true);
    result = await authService.signInAdmin(code);
    setBusy(false);

    if (result == true) {
      navigationService.navigateTo(Routes.homePageAdmin);
    }
  }
}
