/*=============== Owned packages ===================*/
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageViewModel extends BaseModel {
  Set<Marker> issueMarkers = {};
  Set<Marker> get _issueMarkers => issueMarkers;
  Future<void> disposeViewModel() async {
    await authService.signOut();
  }

  Set<Marker> setMarkers(double? lat, double? longi) {
    issueMarkers.add(Marker(
      markerId: MarkerId(LatLng(lat ?? 0, longi ?? 0).toString()),
      position: LatLng(lat ?? 0, longi ?? 0),
      icon: BitmapDescriptor.defaultMarker,
    ));
    return issueMarkers;
  }
}
