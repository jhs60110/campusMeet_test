import 'package:campus_meet/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'University_setting_screen.dart';
import 'home_screen.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignInPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* 필수";
    } else if (value.length < 8) {
      return "비밀번호는 8자리 이상입니다.";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('asset/campusMeetLogo.png')),
                  ), //캠퍼스밋이미지가져와
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                      //controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    obscureText: true,
                    //controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.patternString(
                          r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          '8자리이상,숫자,특수문자를 포함해주세요.')
                    ]),
                    //validatePassword,        //Function to check validation
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.pinkAccent,
                  child: Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xffff375c),
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      //print(nameController.text);
                      //print(passwordController.text);

                      if (formkey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                        print("Validated"); // 사용자 정보 맞았을때 넘어가야하는데
                                            //지금은 구현 못하는게 맞는지? 일단 했다 치고
                      } else {
                        print("Not Validated");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.pinkAccent,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                        //요기서 화면 바 SettingUnivPage() RadioApp() DropDown()
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )),
      ),
    );
  }
}
