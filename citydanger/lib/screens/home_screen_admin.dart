import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomePageAdmin extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => {_openDrawer()}),
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onTap: () {
                  model.navigationService.navigateTo(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
}
