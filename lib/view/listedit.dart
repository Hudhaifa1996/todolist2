import 'package:flutter/material.dart';
import 'package:todolists/view/widget.dart';
import 'package:go_router/go_router.dart';

class ListEdit extends StatelessWidget {
  ListEdit({super.key});

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: const Alignment(1, 1),
                  child: GestureDetector(
                    onTap: () {
                      context.go('/home');
                    },
                    child: const Text(
                      'x',
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
                    title: const Text(
                      'Title',
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
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                        textAlign: TextAlign.center),
                    subtitle: TextFormField(
                      maxLines: 5,
                      minLines: 2,
                      controller: myController2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'description',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomButtons(
                    myController: myController, myController2: myController2),
                const SizedBox(
                  height: 100,
                ),
              ],
            )),
      ),
    );
    //
  }
}
