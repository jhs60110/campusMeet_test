import 'package:campus_meet/screen/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet/screen/dropdown.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}
class _DropDownState extends State<DropDown> {
  String dropdownvalue = 'Apple';
  var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDownList Example"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items:items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items)
                  );
                }
                ).toList(),
                onChanged: (newValue){
                  setState(() {
                    dropdownvalue = newValue as String;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}