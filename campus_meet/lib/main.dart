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
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink), home: LoginPage());
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
