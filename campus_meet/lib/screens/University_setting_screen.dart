import 'package:flutter/material.dart';
import 'package:campus_meet/routes.dart';
import 'check_univ_email_screen.dart';

void main() {
  runApp(SettingUnivPage());
}

class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();
  List<String> univ = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대", "용인대2"];
  Map univ_url = {
    '명지대 인문캠퍼스': 'www.mju.ac.kr',
    '명지대 자연캠퍼스': 'www.mju.ac.kr',
    '단국대': 'www.dankook.ac.kr',
    '용인대': 'www.yongin.ac.kr'
  };
  List<String> search_univ = [];
  List<String> search_univ_result = [];
  List<String> select_univ = [];

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print(univ_url.keys.toList());
    // print(search_univ_result);
    //print(search_univ_result.length);
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('학교선택'),
          backgroundColor: color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          //autovalidateMode: AutovalidateMode.always,

          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 380,
                            height: 150,
                            alignment: Alignment(-1.0, 0.0),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '현재 재학중인 학교를 알려주세요👀',
                              //textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            )),
                        // Row(
                        // children: [
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 280,
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: univController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '학교이름',
                                ),
                              ),
                            ),
                            Container(
                              // 회원가입 조건 하나라도 누락 시 색 죽은색/ 조건 무두 완료시 빨
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xffff375c),
                                  borderRadius: BorderRadius.circular(10)),
                              child: FlatButton(
                                onPressed: () {
                                  // print(univController.text);
                                  search_univ_result = [];
                                  search_univ = [];
                                  if (univController.text == "") {
                                  } else {
                                    univ.forEach((value) {
                                      if (value.contains(univController.text)) {
                                        search_univ.add(value);
                                      }
                                    });
                                  }
                                  setState(() {
                                    search_univ_result = search_univ;
                                  });
                                },
                                child: Text(
                                  '검색',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //saerch_univ 를 한줄씩 보여줘
                        Container(
                          height: 200,
                          // padding: EdgeInsets.only(bottom: 200),
                          child: ListView.builder(
                            itemCount: search_univ_result.length,
                            itemBuilder: (context, index) {
                              return TextButton(
                                onPressed: () async {
                                  select_univ = [];
                                  // print("index: " + search_univ_result[index]);
                                  //print("dlrj?"+univ_url[search_univ_result[index]]);
                                  var univ_url_select =
                                      univ_url[search_univ_result[index]];
                                  // print("up : " + univ_url_select);
                                  setState(() {
                                    select_univ.add(univ_url_select);
                                  });
                                   print(select_univ);
                                },
                                child: Text(search_univ_result[index]),
                              );
                            },
                          ),
                        ),



                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            // padding: EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xffff375c),
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () async {
                                print(select_univ);
                                List univEmail = select_univ[0].split('.');
                                print(univEmail); //학교 url중 학교 이름 들어간애만 잘라서 보내@
                                Navigator.of(context).pushNamed(Routes.checkUnivEmailScreen,
                                      arguments: {"univEmail":univEmail[1]});
                              },
                              child: Text(
                                '다음',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
