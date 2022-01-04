import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  group("LoginViewModelTest - ", () {
    setUp(() => registerServices());

    tearDown(() => unregisterServices());

    group("Login method", () {
      test("Verify if user is correct then redirect to homepage", () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        LoginViewModel model = LoginViewModel();

        when(authService.signIn('ed@gmail.com', '12345678'))
            .thenAnswer((_) => Future.value(true));
        await model.login('ed@gmail.com', '12345678');
        verify(navService.navigateTo(Routes.homePage));
      });

      test("Verify if user is not correct then an error is shown to user",
          () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        LoginViewModel model = LoginViewModel();

        when(authService.signIn('ed@gmail.com', '12345678'))
            .thenAnswer((_) => Future.value(false));
        await model.login('ed@gmail.com', '12345678');
        verifyNever(navService.navigateTo(Routes.homePage));
      });
    });
    group("Login method Admin", () {
      test("Verify if user is correct then redirect to homepage", () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        LoginViewModel model = LoginViewModel();

        when(authService.signInAdmin(
                '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'))
            .thenAnswer((_) => Future.value(true));
        await model.loginAdmin(
            '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
        verify(navService.navigateTo(Routes.homePageAdmin)).called(1);
      });

      test("Verify if user is not correct then an error is shown to user",
          () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        LoginViewModel model = LoginViewModel();

        when(authService.signInAdmin(
                '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'))
            .thenAnswer((_) => Future.value(false));
        await model.loginAdmin(
            '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
        verifyNever(navService.navigateTo(Routes.homePageAdmin));
      });
    });
  });
}
