// ignore_for_file: file_names
/*=============== Owned packages ===================*/
import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/

class SignUpViewModel extends BaseModel {
  Future<void> signUp(
      String email, String password, String firstname, String lastname) async {
    bool result = false;

    setBusy(true);
    result = await authService.registerWithEmailAndPassword(
        email, password, firstname, lastname);
    setBusy(false);

    if (result == true) {
      navigationService.navigateTo(Routes.homePage);
    }
  }
}
