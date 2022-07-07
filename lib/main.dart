//dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:travel_planner/model/profile.dart';
import 'package:travel_planner/model/trips.dart';
import 'package:travel_planner/pages/travelStartPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider<Profile>(
        create: (_) => Profile(),
      ),
      ChangeNotifierProvider(
          create: (_) => Trips())
    ],
        child: MaterialApp(
          title: 'Travel Planner',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TravelStartPage(),
        )
    );
  }
}