import 'package:campus_meet/screen/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet/screen/dropdown.dart';

class DropDown extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<DropDown> {
  List<String> countries = ["Canada", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  var seen = <String>{};
  List<String> uniquelist = countries.where((student) => seen.add(student.name)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CampusMeet'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '로그인!',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                DropdownButton(
                  value: uniquelist[0],
                  items: uniquelist.map((country){
                    return DropdownMenuItem(
                      child: Text(country),
                      value: country,
                    );
                  }).toList(),
                  onChanged: (country){
                    print("You selected: $country");
                  },
                )

              ],
            )));
  }
}