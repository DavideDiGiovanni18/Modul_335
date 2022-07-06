//dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/model/profile.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/travelStartPage.dart';

void main() {
  Profile data = Profile();
  runApp( MyApp(data));
}

class MyApp extends StatelessWidget {
  final Profile data;
  MyApp(this.data, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Profile>(
      create: (_)=>data,
      child: MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
      )
    );
  }
}