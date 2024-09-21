import 'package:flutter/material.dart';
class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Image.asset ('lib/assets/1.jpg',
              height: 400),
                Text('To do list App',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'calibri',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 200.0,
                  child: Text('it is a program to manipulate your daily to do list',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                      fontFamily: 'calibri',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
      ]
    ),
    ));
  }
}
