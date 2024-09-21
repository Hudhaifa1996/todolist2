import 'package:flutter/material.dart';
class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset ('lib/assets/3.jpg',
                  height: 400,
                ),
                Text('Deleting completed ones',
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
                  child: Text('You can delete completed points from your daily list'
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
