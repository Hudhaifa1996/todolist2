import 'package:flutter/material.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/view/listedit.dart';
import 'package:provider/provider.dart';


class CustomButtons extends StatelessWidget {
  late final myController;
  late final myController2;
  CustomButtons({super.key, required this.myController, required this.myController2});

  late int buttonsNo;
  @override

  Widget build(BuildContext context) {
    buttonsNo = Provider.of<listProvider>(context, listen: false).buttonsNo;

    if (buttonsNo == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<listProvider>(context, listen: false)
                  .editTitle(myController.text, myController2.text);
              // print('getCard1 is');
              // print();
              Navigator.pushReplacementNamed(context, '/home');
              Navigator.pushReplacementNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // شكل الزر
              ),
            ),
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            label: const Text(
              'Edit',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'calibri',
              ),
            ),
            //
          ),
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<listProvider>(context, listen: false).deleteTitle();
              Navigator.pushReplacementNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // شكل الزر
              ),
            ),
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
            label: const Text(
              'Delete',
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
      );
    } else {
      return ElevatedButton.icon(
        onPressed: () {
          Provider.of<listProvider>(context, listen: false)
              .saveTitle(myController.text, myController2.text);
          Navigator.pushReplacementNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(
          Icons.save,
          color: Colors.black,
        ),
        label: const Text(
          'Save',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'calibri',
          ),
        ),
//
      );
    }
  }
}
