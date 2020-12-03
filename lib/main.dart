import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double firstNumber;
  double secondNumber;
  String dropdownValue = '+';
  double result = 0;
  double operation(){
    dropdownValue== '+'? result = firstNumber + secondNumber:
    dropdownValue== '-'? result = firstNumber - secondNumber:
    dropdownValue== '*'? result = firstNumber * secondNumber:
    dropdownValue== '/'? result = firstNumber / secondNumber:0;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color(0xffe8e8e8),
        appBar: AppBar(
          backgroundColor: Color(0xff214252),
          title: Text(
            'CALCULATOR',
            style: TextStyle(color: Color(0xffe8e8e8), fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: 140,
                        height: 60,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            decoration: InputDecoration(
                              hintText: 'First Number',
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Color(0xff214252),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xff214252), width: 2.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xff214252), width: 2.5)),
                            ),
                            onChanged: (value) {
                              firstNumber = double.parse(value);
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: TextStyle(color: Color(0xff214252),fontSize: 45),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['+', '-', '*', '/']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: 140,
                        height: 60,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            decoration: InputDecoration(
                              hintText: 'Second Number',
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Color(0xff214252),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xff214252), width: 2.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xff214252), width: 2.5)),
                            ),
                            onChanged: (value) {
                              secondNumber = double.parse(value);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 45,
                child: RaisedButton(
                  color: Color(0xff214252),
                  child: Text(
                    '=',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {
                    setState(() {
                      result = operation();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '$result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff214252),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}