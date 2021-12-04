/*=============== Owned packages ===================*/
import 'package:citydanger/view_models/signUP_viewmodel.dart';
import 'package:citydanger/widgets/buttons/submit_button.dart';
import 'package:citydanger/widgets/signup_widgets/text_box.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SignUpScreen extends StatelessWidget {
  final Function? func;
  SignUpScreen({@required this.func});
  @override
  Widget build(BuildContext context) {
    String emailController = '';
    String passwordController = '';
    String confirmPasswordController = '';
    String firstNameController = '';
    String lastNameController = '';

    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => model.navigationService.popRepeated(1),
          ),
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
                  "Introduce the email",
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
                TextBoxCustom(textController: passwordController),
                const SizedBox(
                  height: 10,
                ),
                TextBoxCustom(textController: confirmPasswordController),
                const SizedBox(
                  height: 10,
                ),
                TextBoxCustom(textController: firstNameController),
                const SizedBox(
                  height: 10,
                ),
                TextBoxCustom(textController: lastNameController),
                const SizedBox(
                  height: 30,
                ),
                BusyButton(
                  text: "Submit",
                  onTap: () async {
                    //func;
                  },
                  busy: false,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
