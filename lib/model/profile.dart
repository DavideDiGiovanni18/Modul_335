import 'package:flutter/material.dart';
import 'package:location/location.dart';


class Profile extends ChangeNotifier{
  late String name;
  Profile() {
    name ="Davide Di Giovanni";
  }

  getName() {
    return name;
  }
}
