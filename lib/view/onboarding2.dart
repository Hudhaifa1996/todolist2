import 'package:flutter/material.dart';
class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset ('lib/assets/2.jpg',
                height: 400,
                ),
                Text('Adding many points',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'calibri',
                  ),
                ),
                Container(
                  height: 200.0,
                  padding: EdgeInsets.all(20.0),
                  child: Text('You can add many points to your daily list and edit them'
                      ''
                      '',
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
