import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/profile.dart';
import 'package:travel_planner/pages/travelPage.dart';
import 'package:travel_planner/pages/travelStartPage.dart';

class ProfilePage extends StatefulWidget {
  _profile createState() => _profile();
}

class _profile extends State<ProfilePage> {

  Location location = new Location();
  late bool _isServiceEnabled;
  late LocationData _locationData;
  late PermissionStatus _permissionStatus;
  bool _isGeoLocation = false;


  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Profile>(context);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.cyan,
          title: Center(child: Text("Profile")),
          leading: Builder(builder: (BuildContext context) {
            //left side
            return IconButton(
                icon: Icon(Icons.create),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TravelStartPage();
                  }));
                });
          }),
          //right side
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TravelPage();
                  }),
                );
              },
            )
          ],
        ),
        body: Center(
            child: Column(
                children: [
                  Image.asset('assets/images/profile.png', height: 400,
                    width: 300,),
                  Text(name.getName(),style: TextStyle(
                    fontSize: 30,
                  ),),
                  ElevatedButton(onPressed: () async {
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
                    setState(() {
                      _isGeoLocation = true;
                    });
                  },
                    child: Text("Show your Current Location")),_isGeoLocation ? Text(
                        'Location: ${_locationData.latitude}/${_locationData
                            .longitude}') : Container(),
                ])));
  }
}
