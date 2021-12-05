import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  String splitString(String firstName) {
    return firstName.characters.first;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
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
              UserAccountsDrawerHeader(
                accountName: Text(model.firstname + " " + model.lasname),
                accountEmail: Text(model.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    splitString(model.firstname),
                    style: TextStyle(
                        fontSize: 40.0, color: Theme.of(context).canvasColor),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  model.navigationService.navigateTo(Routes.loginScreen);
                },
              ),
              const ListTile(
                leading: Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                ),
                title: Text(
                  "Reward Points",
                  style: TextStyle(color: Colors.white),
                ), //add at data model users points reward
              ),
            ],
          ),
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
