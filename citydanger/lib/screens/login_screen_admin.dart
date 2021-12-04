import 'package:citydanger/view_models/login_viewmodel.dart';
import 'package:citydanger/widgets/buttons/submit_button.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String codeController = '';
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
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
                  height: 200,
                ),
                Text(
                  "Introduce the unique code",
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
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    maxLength: 100,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 15.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    onChanged: (value) => codeController = value,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BusyButton(
                  text: "Submit",
                  onTap: () async {},
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
