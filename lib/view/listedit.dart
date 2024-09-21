import 'package:flutter/material.dart';
import 'package:todolists/main.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:provider/provider.dart';
import 'package:todolists/viewmodel/vm_listdetails.dart';



class Listedit extends StatelessWidget {
  // const Listdetails({super.key});

  // myController.value = TextEditingValue(text: '');
  // final myController3 = TextEditingController();
  // MiniCard miniCard = MiniCard('','');
  // List hoz = [];
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   myController2.dispose();
  //   // myController3.dispose();
  //   // super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    final myController = TextEditingController(text: Provider.of<listProvider>(context, listen: false).getCard1![Provider.of<listProvider>(context, listen: false).index]);
    final myController2 = TextEditingController(text: Provider.of<listProvider>(context, listen: false).getCard2![Provider.of<listProvider>(context, listen: false).index]);
    return Scaffold(
      body: SafeArea(child:
      Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment(1, 1),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('x',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  subtitle: TextFormField(
                    // initialValue:"hoz" ,
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'title',
                    ),
                  ),),
              ),

              Expanded(
                child:ListTile(
                  title: Text('Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                      textAlign: TextAlign.center
                  ),
                  subtitle:  TextFormField( maxLines: 5, minLines: 2,
                    controller: myController2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'description',
                    ),
                  ),),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(onPressed: (){
                    Provider.of<listProvider>(context, listen: false).editTitle(myController.text, myController2.text);
                    // print('getCard1 is');
                    // print();
                    Navigator.pushReplacementNamed(context, '/home');

                    // print ('con1 ${myController.text} &&& con2 ${myController2.text}');
                    // print (context.watch<listProvider>().myController2);
                    // hoz.add(MiniCard(myController.text,myController2.text));
                    //  print();
                    // Provider.of<listProvider>(context, listen: false).editTitle(myController.text, myController2.text);
                    Navigator.pushReplacementNamed(context, '/home');

                  },
                    // style:
                    // child: Text('Click me!'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.redAccent ,
                      // primary: Colors.red, // لون الخلفية
                      // onPrimary: Colors.white, // لون النص
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // شكل الزر
                      ),
                    ),
                    icon: Icon(Icons.edit,
                      color: Colors.black,

                    ),
                    label: Text('Edit',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'calibri',
                      ),
                    ),
                    //
                  ),
                  ElevatedButton.icon(onPressed: (){
                    // print ('con1 ${myController.text} &&& con2 ${myController2.text}');
                    // print (context.watch<listProvider>().myController2);
                    // hoz.add(MiniCard(myController.text,myController2.text));
                    //  print();
                    Provider.of<listProvider>(context, listen: false).deleteTitle();
                    Navigator.pushReplacementNamed(context, '/home');

                  },
                    // style:
                    // child: Text('Click me!'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.redAccent ,
                      // primary: Colors.red, // لون الخلفية
                      // onPrimary: Colors.white, // لون النص
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // شكل الزر
                      ),
                    ),
                    icon: Icon(Icons.delete,
                      color: Colors.black,

                    ),
                    label: Text('Delete',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'calibri',
                      ),
                    ),
                  //
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],

          )

      ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    //
  }
}
