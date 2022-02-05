import 'package:flutter/material.dart';

import 'game.dart';

class LoginPage extends StatefulWidget {
  static const buttonSize = 60.0;

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _input = '';
  String _check = 'ทายเลข 1 ถึง 100';
  var game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Guess',
                              style: TextStyle(
                                  fontSize: 36.0, color: Colors.purple.shade200)),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'THE NUMBER',
                            style: TextStyle(fontSize: 18.0,color: Colors.purple.shade600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_input, style: TextStyle(fontSize: 40.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_check, style: TextStyle(fontSize: 20.0)),
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
                        _buildButton(-2),
                        _buildButton(0),
                        _buildButton(-1),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          var input = int.tryParse(_input!);
                          var a = game.doGuess(input!);
                          if(input == null){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('ERROR'),
                                  content: Text('โปรดป้อนตัวเลขเท่านั้น'),
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
                          }
                          else if(a == 1){
                            setState(() {
                              _check = '$_input : มากเกินไป';
                              _input = '';
                            });
                          }else if(a == -1){
                            setState(() {
                              _check = '$_input : น้อยเกินไป';
                              _input = '';
                            });
                          }else{
                            setState(() {
                              _check = '$_input : ถูกต้อง (ทาย ${game.guessCount} ครั้ง)';
                              _input = '';
                            });
                          }
                        },
                        child: Text('GUESS'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
          } else if (num == -2) {
            print('Remove');

            setState(() {
              // '12345'
              var length = _input.length;
              _input = "";
            });
          } else {
            print('$num');
            if(_input.length < 3) {
              setState(() {
                _input = '$_input$num';
              });
            }else{

            }
          }
        },
        borderRadius: BorderRadius.circular(LoginPage.buttonSize / 2),
        child: (num == -2)
            ? Container(
                decoration: (num == -2)
                    ? null
                    : BoxDecoration(
                        border: Border.all(width: 2.0),
                        shape: BoxShape.circle,
                      ),
                alignment: Alignment.center,
                width: LoginPage.buttonSize,
                height: LoginPage.buttonSize,
                // conditional operator (?:)
                child: Icon(
                  Icons.disabled_by_default,
                ),
              )
            : Container(
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
