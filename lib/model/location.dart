import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Locationn extends ChangeNotifier {
  Location location = new Location(); //
  late bool _isServiceEnabled;
  late LocationData _locationData;
  late PermissionStatus _permissionStatus;
  bool _isGeoLocation = false;

  void locationMethod() async {
    _isServiceEnabled = await location.serviceEnabled();
    if (!_isServiceEnabled) {
      _isServiceEnabled = await location.requestService();
      if (_isServiceEnabled) return;
    }

    _permissionStatus = await location.requestPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_isServiceEnabled != PermissionStatus.granted) return;
    }
    _locationData = await location.getLocation();
    _isGeoLocation = true;
  }

  bool getIsGeoLocation() {
    return _isGeoLocation;
  }

  String getLongitude() {
    return _locationData.longitude.toString();
  }

  String getLatitude() {
    return _locationData.latitude.toString();
  }
}
