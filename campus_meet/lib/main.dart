import 'package:campus_meet/screens/home_screen.dart';
import 'package:campus_meet/screens/my_meeting_screen.dart';
import 'package:campus_meet/screens/my_page_screen.dart';
import 'package:campus_meet/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet/screens/SignIn_Screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    MaterialColor createMaterialColor(Color color) {
      List strengths = <double>[.05];
      final swatch = <int, Color>{};
      final int r = color.red, g = color.green, b = color.blue;

      for (int i = 1; i < 10; i++) {
        strengths.add(0.1 * i);
      }
      strengths.forEach((strength) {
        final double ds = 0.5 - strength;
        swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1,
        );
      });
      return MaterialColor(color.value, swatch);
    }

    return MaterialApp(
        theme: ThemeData(
            primarySwatch:  createMaterialColor(Color(0xffff375c))
        ), home: LoginPage());

  }
}
/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Meet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              MyMeetingScreen(),
              MyPageScreen(),
            ],
          ),
          bottomNavigationBar: const BottomBar(),
        ),
      ),
    );
  }
}*/
