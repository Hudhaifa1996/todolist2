import 'package:flutter/material.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CustomButtons extends StatelessWidget {
   final TextEditingController myController;
   final TextEditingController myController2;

  const CustomButtons(
      {super.key, required this.myController, required this.myController2});

  @override
  Widget build(BuildContext context) {

    if (Provider.of<ListProvider>(context, listen: false).isOneButton == false) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<ListProvider>(context, listen: false)
                  .editTitle(myController.text, myController2.text);
              // print('getCard1 is');
              // print();
              context.go('/home');
              context.go('/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
              Provider.of<ListProvider>(context, listen: false).deleteTitle();
              context.go('/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
          Provider.of<ListProvider>(context, listen: false)
              .saveTitle(myController.text, myController2.text);
          context.go('/home');
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
