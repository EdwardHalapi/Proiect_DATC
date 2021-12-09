/*=============== Owned packages ===================*/
import 'package:citydanger/widgets/setup_dialog_ui.dart';
import 'package:citydanger/widgets/setup_snackbar_ui.dart';
import 'navi.router.dart';
import 'locator.dart';
/*=============== Extern packages ==================*/
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      title: 'EasyMaintain',
      theme: ThemeData(
        primaryColor: HexColor("#2E8C59"),
        backgroundColor: HexColor("#66C992"),
        canvasColor: HexColor("#35A367"),
      ),
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
