import 'package:flutter/material.dart';
import 'package:campus_meet/main.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';

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
  TextEditingController passwordEController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  // 안쓰는거 지워 !
  String montDropdownvalue = '1';
  String dayDropdownvalue = '1';
  Gender? _gender = Gender.MAN;

/*var _ageList = ['19', '20', '21', '22', '23', '24', '25'];
var _selectedValue = '24';8*/

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    Color color = Color(0xffff375c);
    //https://kor.pakostnici.com/408272-how-to-select-birth-date-ZRRTII 날짜 관련 참고
    List month = [];
    for (int i = 1; i < 13; i++) {
      String ii = i.toString();
      month.add(ii);
    }
    List day = [];
    for (int i = 1; i < 32; i++) {
      String ii = i.toString();
      day.add(ii);
    } //1 3 5 7 8 10 12 <- 31일
    //2월은? 2개?
    //4 6 9 11 <- 30일
    String? validateEPassword(String? value) {
      if (value != passwordController) {
        // The user haven't typed anything
        return "비밀번호가 일치하지 않습니다~.";
      }
      else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CampusMeet'),
        backgroundColor: color,
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
                  )
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  ),
                  validator: Validators.compose([
                    Validators.required('Password is required'),
                    Validators.patternString(
                        r'^(?=.*?[ㄱ-힣]).{2,5}$', //한국어 검사는 없어? 최댓값지정해야하나? //pass
                        '이름을 입력해주세요')
                  ]),
                ),
              ), //이름

              // 학번 입력받을때 숫자패드만 보이게 아래 참고
              // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number, //안뜨는데?
                  controller: studentIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '학번', //텍스트필드말고 숫자만?데 두자리?
                  ),
                  validator: Validators.compose([
                    Validators.required('학번을 입력해주세요'),
                    Validators.patternString(
                        r'^(?=.*?[0-9]).{1,2}$', '압헉년도 2자리입니다.')
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nicknameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '별명', //별명이 필수인가?
                  ),
                ),
              ),
              Container(
                //signin 65
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  //비밀번호 조건
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                  validator: Validators.compose([
                    Validators.required('Password is required'),
                    Validators.patternString(
                        r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        '8자리이상,숫자,특수문자를 포함해주세요.')
                  ]),
                ),
              ),
              Container(
                //비밀번호확
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                    obscureText: true,
                    controller: passwordEController,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(), labelText: 'Password'),
                    //validateEPassword:
                  validator: (value){ //애러메세지 띄워
                      if (value == passwordController.text){
                        //print("비밀번호가 일치합니다");
                      }
                      else{
                        //print('비밀번호가 일치하지 않습니다벨');
                      }
                  },
                ),
              ),
              //비밀번호 확인
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      //padding설
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: yearController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '출생년도',
                        ),
                        validator: Validators.compose([
                          Validators.required('출생년도를 입력해주세요'),
                          Validators.patternString(
                              r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)].{3,4}$',
                              'ex) 1999')
                        ]),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(
                          child: DropdownButton(
                            value: montDropdownvalue,
                            items: month.map((month) {
                              return DropdownMenuItem(
                                  value: month, child: Text(month));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                montDropdownvalue = newValue as String;
                              });
                            },
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: DropdownButton(
                            value: dayDropdownvalue,
                            items: day.map((day) {
                              return DropdownMenuItem(
                                  value: day, child: Text(day));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dayDropdownvalue = newValue as String;
                              });
                            },
                          ),
                        )),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
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
                    width: MediaQuery.of(context).size.width * 0.4,
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
              Container( // 회원가입 조건 하나라도 누락 시 색 죽은색/ 조건 무두 완료시 빨
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xffff375c),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    //print(nameController.text);
                    //print(passwordController.text);
                    print('이름: ' + nameController.text);
                    print('학교: ' + universityController.text);
                    print('학번: ' + studentIDController.text);
                    print('성별: ' + genderController.text);
                    print('나이?없음' + ageController.text);
                    print('아이디없음' + idController.text);
                    print('비밀번호: ' + passwordController.text);
                    print('비밀번호확인: ' + passwordEController.text);
                    print('별명: ' + nicknameController.text);
                    print('한줄소개: ' + introductionController.text);
                    print('출생년: ' + yearController.text);
                    if (formkey.currentState!.validate() && passwordController.text == passwordEController.text) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
