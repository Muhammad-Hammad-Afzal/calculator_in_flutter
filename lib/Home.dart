import 'package:cal/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userdata = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userdata.toString(), style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(result.toString(), style: TextStyle(fontSize: 40, color: Colors.white),
                      ),





                      ]
                  ),
                ),

              Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                MyButton(title: 'AC', onpress: (){
                                  userdata = ('');
                                  result = ('');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '+/-', onpress: (){
                                  userdata += ('+/-');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '%', onpress: (){
                                  userdata += ('%');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '/', color: Color(0xffffa00a), onpress: (){
                                  userdata += ('/');
                                  setState(() {

                                  });
                                },),
                              ],
                            ),
                            Row(
                              children: [
                                MyButton(title: '7', onpress: (){
                                  userdata += ('7');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '8', onpress: (){
                                  userdata += ('8');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '9', onpress: (){
                                  userdata += ('9');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: 'x', color: Color(0xffffa00a), onpress: (){
                                  userdata += ('x');
                                  setState(() {

                                  });
                                },),
                              ],
                            ),
                            Row(
                              children: [
                                MyButton(title: '4', onpress: (){
                                  userdata += ('4');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '5', onpress: (){
                                  userdata += ('5');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '6', onpress: (){
                                  userdata += ('6');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '-', color: Color(0xffffa00a), onpress: (){
                                  userdata += ('-');
                                  setState(() {

                                  });
                                },),
                              ],
                            ),
                            Row(
                              children: [
                                MyButton(title: '1', onpress: (){
                                  userdata += ('1');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '2', onpress: (){
                                  userdata += ('2');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '3', onpress: (){
                                  userdata += ('3');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '+', color: Color(0xffffa00a), onpress: (){
                                  userdata += ('+');
                                  setState(() {

                                  });
                                },),
                              ],
                            ),
                            Row(
                              children: [
                                MyButton(title: '0', onpress: (){
                                  userdata += ('0');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '.', onpress: (){
                                  userdata += ('.');
                                  setState(() {

                                  });
                                },),
                                MyButton(title: 'DEL', onpress: (){
                                  userdata = userdata.substring(0, userdata.length-1);
                                  setState(() {

                                  });
                                },),
                                MyButton(title: '=', color: Color(0xffffa00a), onpress: (){
                                 calculate();
                                 setState(() {

                                 });
                                },),
                              ],
                            ),

                          ],
                        ),

                ),
            ],
          )
        ),
      ),
    );
  }
  void calculate(){
    var finalstring = userdata;
    finalstring = finalstring.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalstring);
    ContextModel contextModel = ContextModel();
    var finaldata = exp.evaluate(EvaluationType.REAL, contextModel);
    result = finaldata.toString();


  }
}

