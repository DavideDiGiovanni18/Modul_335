import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/trips.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/createTripPage.dart';
import 'package:travel_planner/pages/oneTripPage.dart';

class TripsPage extends StatefulWidget {
  _trips createState() => _trips();
}

class _trips extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Trips>(context);
    var value = name.trips; //get List of your Trips

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.brown[200],
          title: Center(child: Text("Ingesamt: " + value.length.toString())),
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
                    return CreateTripPage();
                  }),
                );
              },
            )
          ],
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) => Card(
              child: ListTile(
            leading: CircleAvatar(//Icon links
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
                MaterialPageRoute(
                    builder: (context) => OneTripPage(trip: value[index])),
              );//Übergebe das objekt der ausgewählten Reise
            },
          )),
        )));
  }
}
