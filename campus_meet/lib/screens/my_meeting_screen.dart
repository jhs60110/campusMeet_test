import 'package:flutter/material.dart';

class MyMeetingScreen extends StatefulWidget {
  const MyMeetingScreen({Key? key}) : super(key: key);

  @override
  _MyMeetingScreenState createState() => _MyMeetingScreenState();
}

class _MyMeetingScreenState extends State<MyMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        //autovalidateMode: AutovalidateMode.always,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 52,
                          height: 150,
                          alignment: Alignment(-1.0, 0.0),
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '샛별',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          )),
                      Container(
                          width: 130,
                          height: 150,
                          alignment: Alignment(-1.0, 0.0),
                          child: Text(
                            '님의 미팅',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          )),
                    ],
                  ),
                ),
              ),
              ]),
      ),

    );
  }
}
