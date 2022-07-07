import 'package:flutter/material.dart';
import '../model/trip.dart';

class OneTripPage extends StatelessWidget {
  const OneTripPage({super.key, required this.trip});

  final Trip trip;//get the selected Trip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.brown[200],
        title: Center(child: Text("Deine Reise")),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/images/youTrip.jpg"),
          ),
          Text("Information about the Trip",
              style: TextStyle(
                  color: Colors.white,
                  height: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          Text(
            "Land: " + trip.getCountry(),
            style: TextStyle(color: Colors.white, height: 2, fontSize: 18),
          ),
          Text(
            "Region: " + trip.getState(),
            style: TextStyle(color: Colors.white, height: 2, fontSize: 18),
          ),
          Text("Stadt: " + trip.getCity(),
              style: TextStyle(color: Colors.white, height: 2, fontSize: 18)),
          Text("Informationen: " + trip.getInformation(),
              style: TextStyle(color: Colors.white, height: 2, fontSize: 18)),
          Text("Datum: " + trip.getDate(),
              style: TextStyle(color: Colors.white, height: 2, fontSize: 18)),
        ],
      ),
    );
  }
}
