import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상태 관리 변수
  int number = 1;
  // 눌러져서 값이 바뀌면 아래에 number가 계속 new가 된다

  // 상태 관리 함수(의미있는 함수)
   void add(){
    setState(() {
      number = number + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage(number)),
            Expanded(child: BottomPage(add)),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  // 전달 받는 변수(매개 변수) -> 전달 받을 때 마다 new
  final int number; // final를 붙히면 new를 된 것
  HeaderPage(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      // Align : 위치 지정
      child: Align(
        child: Text(
          "$number",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 100,
            decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  // 기본 default를 final로 만들어 놓고 -> 읽기
  // Function add;
  // var add; // 값은 계속 받을 수 있는데 타입은 바뀌지않고
  // dynamic add; // object와 같은 타입
  final add; // 타입을 추론해서 들어간다


  BottomPage(this.add, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          onPressed: (){
            add();
          },
          child: Text("증가", style: TextStyle(fontSize: 100),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
