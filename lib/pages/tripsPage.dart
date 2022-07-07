import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/trips.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/travelPage.dart';
import 'package:travel_planner/pages/yourTripPage.dart';

class TripsPage extends StatefulWidget {
  _trips createState() => _trips();
}

class _trips extends State<TripsPage> {

  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Trips>(context);
    var value = name.trips;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Center(
              child: Text("Deine Reisen ingesamt: " + value.length.toString())),
          backgroundColor: Colors.brown[200],
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
              icon: Icon(Icons.create),
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
        body: SafeArea(
            child: ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) =>
                  Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.airplane_ticket_outlined),
                        ),
                        title: Text("Reise nach " + value[index].getCountry()),
                        subtitle: Text("Stadt: " +
                            value[index].getCity() +
                            " am " +
                            value[index].getDate().toString()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                YourTripPage(trip: value[index])),
                          );
                        },
                      )),
            )));
  }
}
