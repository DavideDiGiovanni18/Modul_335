import 'package:flutter/material.dart';
import 'package:travel_planner/model/trip.dart';

class Trips extends ChangeNotifier {
  late List<Trip> trips;


  Trips() {
    trips = [];
    Trip a = Trip();
    a.setCity("Zürich");
    a.setCountry("Schweiz");
    a.setState("Zürich");
    a.setInformation("Schuhe mitnehmen");
    a.setDate(DateTime.now());
    trips += [a];


    Trip b = Trip();
    b.setCity("Wien");
    b.setCountry("Oestereich");
    b.setState("Romanshorn");
    b.setInformation("Schuhe mitnehmen");
    b.setDate(DateTime.now());
    trips += [b];
  }
  List<String> get trip => List.unmodifiable(trips);

  void addTrip(Trip tripss){
    trips.add(tripss);
    notifyListeners();
  }
}