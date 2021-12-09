import 'package:citydanger/view_models/base_model.dart';

class HomePageViewModel extends BaseModel {
  Future<void> disposeViewModel() async {
    await authService.signOut();
  }
}
