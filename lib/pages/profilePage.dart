import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/location.dart';
import 'package:travel_planner/model/profile.dart';
import 'package:travel_planner/pages/travelStartPage.dart';
import 'package:travel_planner/pages/tripsPage.dart';

class ProfilePage extends StatefulWidget {
  _profile createState() => _profile();
}

class _profile extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Profile>(context);
    var loc = Provider.of<Locationn>(context);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.brown[200],
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
                    return TripsPage();
                  }),
                );
              },
            )
          ],
        ),
        body: Center(
            child: Column(children: [
          Image.asset(
            'assets/images/profile.png',
            height: 400,
            width: 300,
          ),
          Text(
            name.getName(),
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () async {
                loc.locationMethod();
                setState(() {
                  loc.getIsGeoLocation();
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown)),
              child: Text("Show your Current Location")),
          loc.getIsGeoLocation()//falls Location herausgefunden
              ? Text(
                  'Your Location: Latitude ${loc.getLatitude()}/ Longitude ${loc.getLongitude()}',
                  style:
                      TextStyle(fontSize: 20, height: 2, color: Colors.brown),
                )
              : Container(),
        ])));
  }
}
