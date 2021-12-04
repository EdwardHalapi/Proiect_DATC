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

    return ViewModelBuilder<SignUpViewModel>.reactive(
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
                Container(
                  padding: const EdgeInsets.only(right: 275),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: false,
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => emailController = value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: true,
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => passwordController = value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: true,
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => confirmPasswordController = value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: false,
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => firstNameController = value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: false,
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => lastNameController = value,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BusyButton(
                  text: "Submit",
                  onTap: () async {
                    await model.signUp(emailController, passwordController,
                        firstNameController, lastNameController);
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
