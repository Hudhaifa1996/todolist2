import 'package:flutter/material.dart';
import 'package:todolists/main.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:provider/provider.dart';



class Listdetails extends StatelessWidget {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  void dispose() {
    myController.dispose();
    myController2.dispose();
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
  Provider.of<listProvider>(context, listen: false).saveTitle(myController.text, myController2.text);
  Navigator.pushReplacementNamed(context, '/home');

  },
  style: ElevatedButton.styleFrom(
    backgroundColor:Colors.redAccent ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
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
