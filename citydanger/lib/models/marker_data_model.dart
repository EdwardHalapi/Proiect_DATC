import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerDataModel {
  Set<Marker> issueMarkers = {};
  MarkerDataModel({required this.issueMarkers});
  static MarkerDataModel fromMap(Set<Marker> markerList) {
    if (markerList.isEmpty) {
      print("NOT GOOD");
    }
    return MarkerDataModel(issueMarkers: markerList);
  }

  Set<Marker> get _issueMarker => issueMarkers;
}
