import 'package:flutter/material.dart';
import 'package:travel_planner/model/trip.dart';

class Trips extends ChangeNotifier {
  late List<Trip> trips;


  Trips() {
    trips = [];//initalize List
    Trip a = Trip();//first testobject
    a.setCity("Zürich");
    a.setCountry("Schweiz");
    a.setState("Zürich");
    a.setInformation("Schuhe mitnehmen");
    a.setDate(DateTime.now());
    trips += [a];//add to List


    Trip b = Trip();//second testobject
    b.setCity("Wien");
    b.setCountry("Oestereich");
    b.setState("Romanshorn");
    b.setInformation("Schuhe mitnehmen");
    b.setDate(DateTime.now());
    trips += [b];//add to List
  }

  List<String> get trip => List.unmodifiable(trips);

  void addTrip(Trip tripss){
    trips.add(tripss);
    notifyListeners();
  }
}