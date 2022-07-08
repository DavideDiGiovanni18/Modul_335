import 'package:flutter/material.dart';

class Profile extends ChangeNotifier{
  late String name;
  Profile() {
    name ="Davide";
  }

  String getName() {
    return name;
  }
}
