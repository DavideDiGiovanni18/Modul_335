import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:travel_planner/model/trip.dart';
import 'package:travel_planner/model/trips.dart';
import 'package:travel_planner/pages/profilePage.dart';
import 'package:travel_planner/pages/tripspage.dart';


class CreateTripPage extends StatefulWidget {
  _travel createState() => _travel();
}

class _travel extends State<CreateTripPage> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  var _selectedDay = DateTime.now();
  final informationController = TextEditingController();
  Trip trips = Trip();//Initialize Data for the Trip

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    informationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Trips>(context);
    var dataTrips = name.trips;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
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
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TripsPage();
                }),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/travel.jpg"),
                fit: BoxFit.cover,
              )),
              child: Center(
                  child: Text("Travel",
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'DancingScript', //own font
                          color: Colors.white))),
            ),
            Center(
                child: Text(
              "Choose your Date",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 3),
            )),
            WeeklyDatePicker(
              //Package
              selectedDay: _selectedDay, // DateTime
              changeDay: (value) => setState(() {
                _selectedDay = value;
              }),
            ),
            Center(
                child: Text(
              "Your Prefered Location",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 3),
            )),
            SelectState(onCountryChanged: (value) {
              //Package
              setState(() {
                countryValue = value; //Land
              });
            }, onStateChanged: (value) {
              //Kanton/Region
              setState(() {
                stateValue = value;
              });
            }, onCityChanged: (value) {
              //Stadt
              setState(() {
                cityValue = value;
              });
            }),
            Center(
                child: Text(
              "Your Text",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 2),
            )),
            SizedBox(height: 5),
            TextField(
                controller: informationController,
                decoration: InputDecoration(
                    labelText: "Text",
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.3, color: Colors.black), //<-- SEE HERE
                    ))),
            SizedBox(height: 10),
            Expanded(
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final i = AudioPlayer();
                        i.play(//Confirmation Sound
                            DeviceFileSource("assets/sound/confirmation.mp3"));

                        if (countryValue.isNotEmpty) {//take data from Form
                          //if not empty
                          if (stateValue.isEmpty) {
                            stateValue = "Keine Angabe";
                          }
                          if (cityValue.isEmpty) {
                            cityValue = "Keine Angabe";
                          }
                          if (informationController.text.isEmpty) {
                            informationController.text = "Keine Informationen";
                            informationController.clear();
                          }
                          trips.setDate(_selectedDay);
                          trips.setCountry(countryValue);
                          trips.setState(stateValue);
                          trips.setCity(cityValue);
                          trips.setInformation(informationController.text);
                          dataTrips.add(trips);
                        }

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TripsPage();
                        }));
                      },
                      child: Text("add",
                          style: TextStyle(
                            height: 1,
                          )),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
