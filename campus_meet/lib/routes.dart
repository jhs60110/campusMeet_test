import 'package:campus_meet/screens/check_univ_email_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  Routes._();

  static const String checkUnivEmailScreen = '/checkUnivEmailScreen';

  static final routes = <String, WidgetBuilder>{
    checkUnivEmailScreen: (BuildContext context) => CheckUnivPage()
  };
}