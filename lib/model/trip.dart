import 'package:flutter/material.dart';


class Trip extends ChangeNotifier {
  late DateTime datum;
  late String country;
  late String state;
  late String city;
  late String information;

  Trip() {}

  setDate(DateTime time) {
    datum = time;
  }

  String getDate() {
    return datum.day.toString() +"."+datum.month.toString()+"."+datum.year.toString();
  }

  setCountry(String c) {
    this.country = c;
  }

  String getCountry() {
    return country;
  }

  setState(String s) {
    this.state = s;
  }

  String getState() {
    return state;
  }

  setCity(String c) {
    this.city = c;
  }

  String getCity() {
    return city;
  }

  setInformation(String info) {
    this.information = info;
  }

  String getInformation() {
    return information;
  }
}
