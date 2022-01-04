import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/login_viewmodel.dart';
import 'package:citydanger/view_models/signUP_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  group("LoginViewModelTest - ", () {
    setUp(() => registerServices());

    tearDown(() => unregisterServices());

   group("Registration Method" , () {
      test("Verify if after reigister user is redirected to homepage ", () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        SignUpViewModel model = SignUpViewModel();
        
        when(authService.
          registerWithEmailAndPassword('ed@gmail.com', '12345678', 'Edward', 'Halapi',0)).thenAnswer((_) => Future.value(true)
        );
        
        await model.signUp('ed@gmail.com', '12345678', 'Edward', 'Halapi',0);
        verify(navService.navigateTo(Routes.homePage));
      });

      test("Verify if email is already in use user is not redirected to homepage ", () async {
        MockAuthService authService = getAndRegisterAuthService();
        MockNavigationService navService = getAndRegisterNavigationService();
        SignUpViewModel model = SignUpViewModel();
        
        when(authService.
          registerWithEmailAndPassword('ed@gmail.com', '12345678', 'Edward', 'Halapi',0)).thenAnswer((_) => Future.value(false)
        );
        await model.signUp('ed@gmail.com', '12345678', 'Edward', 'Halapi',0);
        verifyNever(navService.navigateTo(Routes.homePage));
      });
    });
  });
}
