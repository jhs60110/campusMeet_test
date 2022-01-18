import 'package:flutter/material.dart';
import 'package:campus_meet/main.dart';
enum Gender { WOMEN, MAN }

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController genderController = TextEditingController(); //라디오버튼?
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  // 안쓰는거 지워 !
  String montDropdownvalue = '1';
  String dayDropdownvalue = '1';
  Gender? _gender = Gender.MAN;

  // 학번 입력받을때 숫자패드만 보이게 아래 참고
  // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
/*var _ageList = ['19', '20', '21', '22', '23', '24', '25'];
var _selectedValue = '24';8*/

  @override
  Widget build(BuildContext context) {

    List month =[];
      for (int i = 1; i < 13; i++){
        String ii = i.toString();
        month.add(ii);
      }
    List day =[];
    for (int i = 1; i < 32; i++){
      String ii = i.toString();
      day.add(ii);
    }    //잠만 월마다 일이 달라.....ㅠ

    return Scaffold(
        appBar: AppBar(
          title: Text('CampusMeet'),
        ),
         body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                Container( //회원가입 타이
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '회원가입!',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이름',
                    ),
                  ),
                ),//이름
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: universityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '학교', //텍스트필드말고 학교찾기
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: studentIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '학번', //텍스트필드말고 숫자만?
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: ListTile(
                        title: const Text('여성'),
                        leading: Radio<Gender>(
                          value: Gender.WOMEN,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: ListTile(
                        title: const Text('남성'),
                        leading: Radio<Gender>(
                          value: Gender.MAN,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
// https://api.flutter.dev/flutter/material/Radio-class.html 값을 어떻게 갖고오

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: TextField(
                        controller: yearController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '년도',
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                      child: Center(
                        child: DropdownButton(
                          value: montDropdownvalue,
                          items:month.map((month) {
                            return DropdownMenuItem(
                                value: month,
                                child: Text(month)
                            );
                          }
                          ).toList(),
                          onChanged: (newValue){
                            setState(() {
                              montDropdownvalue = newValue as String;
                            });
                          },
                        ),

                      )
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: DropdownButton(
                            value: dayDropdownvalue,
                            items:day.map((day) {
                              return DropdownMenuItem(
                                  value: day,
                                  child: Text(day)
                              );
                            }
                            ).toList(),
                            onChanged: (newValue){
                              setState(() {
                                dayDropdownvalue = newValue as String;
                              });
                            },
                          ),

                        )
                    ),
                  ],


                ),



          /////////나이  끝
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '별명',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: introductionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '한줄소개',
                    ),
                  ),
                ),

    // 프로필 사진 (선택사항)
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.pinkAccent,
                  child: Text(''),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      child: Text('Sign Up'),
                      onPressed: () {
                        print(nameController.text);
                        print(universityController.text);
                        print(studentIDController.text);
                        print(genderController.text);
                        print(ageController.text);
                        print(idController.text);
                        print(passwordController.text);
                        print(nicknameController.text);
                        print(introductionController.text);
                        print(yearController.text);

                      },
                    )),

              ],
            )));
  }
}