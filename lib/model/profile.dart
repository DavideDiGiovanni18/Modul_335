import 'package:flutter/material.dart';

class Profile extends ChangeNotifier{
  late String name;
  Profile() {
    name ="Davide Di Giovanni";
  }

  String getName() {
    return name;
  }
}
