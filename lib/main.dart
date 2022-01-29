import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homework7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.https,
                          size: 80,
                        ),
                        Padding(padding: const EdgeInsets.all(6)),
                        Text('กรุณาใส่รหัสผ่าน',style: TextStyle(
                          fontSize: 20,
                        ),),
                      ],
                    )
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton4(1),
                            _buildButton4(2),
                            _buildButton4(3),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton4(4),
                            _buildButton4(5),
                            _buildButton4(6),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton4(7),
                            _buildButton4(8),
                            _buildButton4(9),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75.0,
                              height: 75.0,
                            ),
                            _buildButton4(0),
                            Container(
                              width: 75.0,
                              height: 75.0,
                              child: Icon(
                                Icons.label,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        TextButton(onPressed: (){},
                            child: Text('ลืมรหัสผ่าน',style:
                            TextStyle(
                              color: Colors.blue,
                            ),)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _buildButton4(int? num) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      child: TextButton(
        onPressed: (){},
        child: Text('$num'),
      ),
      //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 4.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // สีเงา
              offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
              blurRadius: 4.0,
              spreadRadius: 2.0,
            ),
          ]
      ),
    ),
  );
}
