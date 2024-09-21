import 'package:flutter/material.dart';
import 'package:todolists/main.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:provider/provider.dart';
import 'package:todolists/viewmodel/vm_listdetails.dart';



class Listdetails extends StatelessWidget {
  // const Listdetails({super.key});
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  // final myController3 = TextEditingController();
  // MiniCard miniCard = MiniCard('','');
  // List hoz = [];
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    // myController3.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: myController,
                    // initialValue: 'hoz',
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
ElevatedButton.icon(onPressed: (){
  // print ('con1 ${myController.text} &&& con2 ${myController2.text}');
  // print (context.watch<listProvider>().myController2);
 // hoz.add(MiniCard(myController.text,myController2.text));
 //  print();
  Provider.of<listProvider>(context, listen: false).saveTitle(myController.text, myController2.text);
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
  icon: Icon(Icons.save,
    color: Colors.black,

  ),
  label: Text('Save',
  style: TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'calibri',
  ),
  ),
//
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
