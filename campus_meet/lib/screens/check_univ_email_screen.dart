import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:campus_meet/routes.dart';

class CheckUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<CheckUnivPage> {
  TextEditingController userUnivEmailController = TextEditingController();
  late String univEmail;

  bool visibility = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      univEmail = arguments["univEmail"] as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    // var select_univ;
    return MaterialApp(
        title: 'Fetch Data Example',
        home: Scaffold(
            appBar: AppBar(title: Text("학교이메일확인P"), backgroundColor: color),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      children: <Widget>[
                        Container(
                            width: 380,
                            height: 150,
                            alignment: Alignment(-1.0, 0.0),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '대학교 확인을 위해 \n'
                              '학교 이메일 인증이 필요해요!',
                              //textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            )),
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 150,
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                onChanged: (text) {
                                  setState(
                                    () {
                                      //userUnivEmailController.text = text;
                                    },
                                  );
                                },
                                controller: userUnivEmailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              // 학교이메일 형식
                              height: 60,
                              width: 150,
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '@$univEmail.ac.kr',
                                ),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: userUnivEmailController.text != ""
                                        ? Color(0xffff375c)
                                        : Color.fromARGB(250, 191, 191, 191)),
                                onPressed: () {
                                  setState(() {
                                    visibility = true;
                                  });
                                  String userUnivEmail =
                                      userUnivEmailController.text +
                                          '@$univEmail.ac.kr';
                                  print(userUnivEmail);
                                  //userUnivEmail 로 확인 이메일 보내기
                                  //인증번호 입력칸 뜨기
                                },
                                child: Text(
                                  '전송',
                                  style: TextStyle(
                                    color: userUnivEmailController.text != ""
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: visibility,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 300,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                  ),
                                  TweenAnimationBuilder<Duration>(
                                      duration: Duration(minutes: 3),
                                      tween: Tween(
                                          begin: Duration(minutes: 3),
                                          end: Duration.zero),
                                      onEnd: () {
                                        setState(() {
                                          visibility = false;
                                        });
                                      },
                                      builder: (BuildContext context,
                                          Duration value, Widget? child) {
                                        final minutes = value.inMinutes;
                                        var  seconds = value.inSeconds % 60;
                                        var underTenSecond = seconds.toString();
                                        if (seconds < 10) {
                                          underTenSecond = ("0" + underTenSecond) as String; //아니 String을 앞에 붙이라고 말귀를 못알아들어
                                        };
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text('0$minutes:$underTenSecond',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xffff375c),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)));
                                      })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
                    Container(
                      //다음 버튼
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        // padding: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(250, 191, 191, 191),
                            borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          onPressed: () async {},
                          child: Text(
                            '다음',
                            style: TextStyle(
                              color: userUnivEmailController.text != ""
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
//
