import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/profile.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/createTripPage.dart';
import 'package:travel_planner/pages/tripsPage.dart';

class TravelStartPage extends StatefulWidget {
  _travel createState() => _travel();
}

class _travel extends State<TravelStartPage> {
  @override
  Widget build(BuildContext context) {
    var profil = Provider.of<Profile>(context); //
    // profile information
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.brown[200],
        title: Center(child: Text("Travel-Planner")),
        leading: Builder(builder: (BuildContext context) {
          //left side
          return IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 230,
                width: 230,
                child: Image.asset("assets/images/logoApp.png")),
            Container(
              child: Text(
                "Welcome: " + profil.getName(),
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown[400],
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(5),
            ),
            SizedBox(height: 30),
            Container(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  child: Text("Create a Trip"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateTripPage();
                    }));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown)),
                )),
            SizedBox(height: 30),
            Container(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  child: Text("Your Trips"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TripsPage();
                    }));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown)),
                )),
          ],
        ),
      ),
    );
  }
}
