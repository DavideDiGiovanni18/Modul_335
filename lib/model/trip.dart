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

  setCountry(String count) {
    this.country = count;
  }

  String getCountry() {
    return country;
  }

  setState(String statee) {
    this.state = statee;
  }

  String getState() {
    return state;
  }

  setCity(String cityy) {
    this.city = cityy;
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
