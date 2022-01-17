import 'package:flutter/material.dart';

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

  Gender? _gender = Gender.MAN;
var _ageList = ['19', '20', '21', '22', '23', '24', '25'];
var _selectedValue = '24';

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
                ListTile(
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
// https://api.flutter.dev/flutter/material/Radio-class.html 값을 어떻게 갖고오
                ListTile(
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

                /*Container(

                  padding: EdgeInsets.all(10),
                  child: Row(
                  title: Text('남자'),
                  value: Gender.MAN,
                  groupValue: _gender,
                  onChanged: (value){
                    setState(() {
                      _gender = value;
                    });
                  },

                ),),
*/
 ////////// 나이 시작
               /* Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '나이', //텍스트필드말고 드론다운? 수정불가로
                    ),
                  ),
                ),*/

                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(

                    child: DropdownButton(
                      value: _selectedValue,
                      items: _ageList.map(
                              (value){
                                return DropdownMenuItem(
                                    value: 'value',
                                    child: Text(value),
                                );
                              },
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedValue = value as String;
                        });
                      },
                    ),
                  )
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

                      },
                    )),

              ],
            )));
  }
}