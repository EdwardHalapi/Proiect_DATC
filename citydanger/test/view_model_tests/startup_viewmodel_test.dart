import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/startup_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:stacked_services/stacked_services.dart';

import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';



void main() {

  group("StartupViewModelTest - ", () {
    
    setUp(() => registerServices());
  
    tearDown(() => unregisterServices());

    group("HandleStartupLogic - ", () {
      test("Verify if user is logged in, if  it is it will be directed at home page", () async {
        MockAuthService authService = getAndRegisterAuthService();
        NavigationService navService = getAndRegisterNavigationService();
        StartupViewModel model = StartupViewModel();
        
        when(authService.isUserLoggedIn()).thenAnswer((_) => Future.value(true));
        await model.handleStartUpLogic();
        verify(navService.navigateTo(Routes.homePage));
      });

      test("Verify if user is not logged in, if not it will be directed to loginScreen", () async {
        MockAuthService authService = getAndRegisterAuthService();
        NavigationService navService = getAndRegisterNavigationService();
        StartupViewModel model = StartupViewModel();
        
        when(authService.isUserLoggedIn()).thenAnswer((_) => Future.value(false));
        await model.handleStartUpLogic();
        verify(navService.navigateTo(Routes.loginScreen));
      });
    });
  });
}
