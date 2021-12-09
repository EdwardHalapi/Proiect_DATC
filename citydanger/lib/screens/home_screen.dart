/*=============== Owned packages ===================*/
import 'package:citydanger/navi.router.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';
import 'package:citydanger/widgets/bottomsheets/add_issue_bottomsheet.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:location/location.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  final Location _location = Location();

  HomePage({Key? key}) : super(key: key);

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
                onTap: () async {
                  model.navigationService.navigateTo(Routes.loginScreen);
                  await model.disposeViewModel();
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
          initialCameraPosition: CameraPosition(target: _initialcameraposition),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            showBottomSheetIssue(context, BottomSheetIssue());
          },
          child: const Icon(
            Icons.add_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 15),
        ),
      );
    });
  }

  Future<void> showBottomSheetIssue(
      BuildContext context, Widget bottomSheetIssue) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return bottomSheetIssue;
        });
  }
}
