import 'package:flutter/material.dart';

import 'FirstRoute.dart';

class LoginPage extends StatefulWidget {
  static const buttonSize = 60.0;

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'กรุณาใส่รหัสผ่าน',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildbutton4(),
                  buildbutton3(),
                  buildbutton3(),
                  buildbutton3(),
                  buildbutton3(),
                  buildbutton3(),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(1),
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                      _buildButton(6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(7),
                      _buildButton(8),
                      _buildButton(9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: LoginPage.buttonSize,
                          height: LoginPage.buttonSize,
                        ),
                      ),
                      _buildButton(0),
                      _buildButton(-1),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      print('Forgot password');
                    },
                    child: Text('ลืมรหัสผ่าน'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');
            setState(() {
              // '12345'
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            print('$num');
            if (_input.length < 5) {
              setState(() {
                _input = '$_input$num';
              });
            } else {
              setState(() {
                if(_input.length < 6)
                _input = '$_input$num';
              });
              if (_input != "123456") {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('ERROR'),
                        content: Text('Please try again'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          },
                            child: Text('OK'),
                          )
                        ],
                      );
                    }
                );
              }else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstRoute()
                  ),
                );

              }
            }
          }
        },
        borderRadius: BorderRadius.circular(LoginPage.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
            border: Border.all(width: 2.0),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          width: LoginPage.buttonSize,
          height: LoginPage.buttonSize,
          // conditional operator (?:)
          child: (num == -1) ? Icon(Icons.backspace) : Text('$num'),
        ),
      ),
    );
  }
}

Widget buildbutton3() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 8.0, color: Colors.purple.shade50),
            shape: BoxShape.circle,
          )));
}

Widget buildbutton4() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 8.0, color: Colors.purple),
            shape: BoxShape.circle,
          )));
}

