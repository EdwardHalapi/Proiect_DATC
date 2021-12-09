/*=============== Owned packages ===================*/
import 'package:citydanger/screens/home_screen.dart';
import 'package:citydanger/screens/home_screen_admin.dart';
import 'package:citydanger/screens/login_screen.dart';
import 'package:citydanger/screens/login_screen_admin.dart';
import 'package:citydanger/screens/signup_screen.dart';
import 'package:citydanger/screens/startup_view.dart';
/*=============== Extern packages ==================*/
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  MaterialRoute(page: LoginScreen),
  MaterialRoute(page: SignUpScreen),
  MaterialRoute(page: LoginAdmin),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: HomePageAdmin),
])
class AppSetup {}
