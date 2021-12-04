import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/login_viewmodel.dart';
import 'package:citydanger/widgets/buttons/submit_button.dart';
import 'package:citydanger/widgets/signup_widgets/text_box.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailController = '';
    String passwordController = '';

    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'City Danger Alert',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextBoxCustom(textController: emailController),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextBoxCustom(textController: passwordController),
                const SizedBox(
                  height: 10,
                ),
                BusyButton(
                  text: "Submit",
                  onTap: () async {
                    // func;
                  },
                  busy: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      child: Text(
                        ' Sign Up',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        model.navigationService.navigateTo(Routes.signUpScreen);
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        'LogIn Admin',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        model.navigationService.navigateTo(Routes.loginAdmin);
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
