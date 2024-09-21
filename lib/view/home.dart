import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todolists/main.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/view/listedit.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'dart:math' as math;

// for (var i = 0; i < 10; i++){}
List<int> randomColor = []; //List.generate(20, math.Random().nextInt() * 0xFFFFFF))
// List<int> randomColor = List.generate(20,(math.Random().nextDouble() * 0xFFFFFF).toInt()); //;
// List<int> randomColor = List<int>.generate(20, (int index) => index * index, growable: false);


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // print('randomColor is $randomColor');
    for (var i = 0; i < 10; i++){
      randomColor.add((math.Random().nextDouble() * 0xFFFFFF).toInt());
}
// print(randomColor);
    List<String>? miniCard1 = Provider.of<listProvider>(context, listen: false).getCard1;
    List<String>? miniCard2 = Provider.of<listProvider>(context, listen: false).getCard2;

    // PrefCard(jsonEncode(PrefCard2()));
    // print(cardInfo[2]);
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ ... miniCard1!.map((item) =>
                GestureDetector( onTap: (){
                  // print(cardInfo.indexOf(i));
                  // print(i);
                  Provider.of<listProvider>(context, listen: false).index = miniCard1.indexOf(item);


                  Navigator.pushNamed(context, '/listedit');
                },
                  child: Card(child:
                  Container(
                    color: Color(randomColor[miniCard1.indexOf(item)]).withOpacity(0.5),
    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          miniCard2![miniCard1.indexOf(item)].toString(),
                          style: TextStyle(
                            fontSize: 16,

                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
                  ),
                )
            ),

              // cardInfo.map((quote) => Text(quote)).toList(),
            ]),
      )
      ),

      floatingActionButton: FloatingActionButton.large(onPressed: (){
        Navigator.pushNamed(context, '/listdetails');
        // (context as Element).markNeedsBuild();

        // print(cardInfo);

      },
        child: const Icon(Icons.add, size: 65),
        shape: CircleBorder(),
        backgroundColor: Colors.redAccent,
      ),

    );
  }
}
