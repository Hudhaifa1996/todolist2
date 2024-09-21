import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todolists/view/onboarding1.dart';
import 'package:todolists/view/onboarding2.dart';
import 'package:todolists/view/onboarding3.dart';
import 'package:todolists/viewmodel/vm_onboarding.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {
  // const OnBoarding ({super.key});

  Skip buttonText = Skip(0);
 PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        PageView(
          onPageChanged: (index) {
            buttonText = Skip(index);
(context as Element).markNeedsBuild();
          },
          controller: pageController,
          children: [
            OnBoarding1(),
            OnBoarding2(),
            OnBoarding3()
          ],
        ),
    Container(
      alignment: Alignment(0, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Prefs();
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(buttonText.buttonText,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'calibri',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SmoothPageIndicator(controller: pageController, count: 3),
            GestureDetector(
              onTap: () {
                pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              },
              child: Text(buttonText.buttonText2,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'calibri',
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],

        ))
      ])
      // Center(child: Text('Home Home Home Home Home Home Home'),)
      ,)
      ;
  }
}
