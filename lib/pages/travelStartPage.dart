import 'package:flutter/material.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/travelPage.dart';

class TravelStartPage extends StatefulWidget {
  _travel createState() => _travel();
}

class _travel extends State<TravelStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.cyan,
        title: Center(child: Text("Trip-Planner")),
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
                  return TravelPage();
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
              child: Text(
                "Welcome: Davide",
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
              padding: EdgeInsets.all(5),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "From: ",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            SizedBox(height: 40),
            Container(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  child: Text("Create a Trip"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TravelPage();
                    }));
                  },
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
                      return TravelPage();
                    }));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
