import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var formkey;
    return Scaffold(
      appBar: AppBar(
        title: Text('CampusMeet'),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Column(
            children: <Widget>[
              Container(
                  width: 380,
                  height: 150,
                  alignment: Alignment(-1.0, 0.0),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '거의 다 왔어요! \n회원정보를 입력해주세요!🐣',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
