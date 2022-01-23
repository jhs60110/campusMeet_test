import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/*Future<University> fetchUniversity() async {
  final response = await http.get('http://www.career.go.kr/cnet/front/openapi/openApiMajorCenter.do');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return University.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/

/*class University {
  late final int userId;
  late final int id;
  late final String title;

  University({this.userId, this.id, this.title});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}*/

  /*
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<UniversitySettingScreen> {
  late Future<University> UniversityTitle;

  @override
  void initState() {
    super.initState();
    UniversityTitle = fetchUniversity();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<University>(
            future: UniversityTitle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}*/
