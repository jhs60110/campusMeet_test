import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:campus_meet/model/post_model.dart';
// 인터넷에서 데이터를 가져오는데 시간이 걸리므로 비동기 함수로 하자.
Future<List<Post>> fetchPost() async { //인터넷에서 데이터를 가져오려 만든 함수 Feature <List<Post>>를 반환
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')); //서버에서 json데이터를 요청함, json응답데이터는 응답변수에 저장됨

  if (response.statusCode == 200) { //응답 상태코드가 200번인지 확인
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// fromMap()팩토리 메서드를 활용하여 json을 post로 변환함
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else { //상태코드 200번이 아니라면 예외 발생
    throw Exception('Failed to load album');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Post>> futurePost;

  @override
  void initState() { // initState()에서 fetchPost() 함수를 호출
    super.initState(); //api호툴에는 빌드방법을 사용하지 않는것이 좋음 그래서 initState에서 호출
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: FutureBuilder<List<Post>>(//인터넷의 데이터를 표시하려면 FutureBuilder 위젯을 사용하십시오. FutureBuilder는 future와 builder를 받습니다. 이 경우 future는 futurePost이고 빌더는 화면 렌더링을 담당합니다.
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].title}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].body}"),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
