import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    VmHome(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...Provider.of<ListProvider>(context, listen: false).getTitles.indexed.map(((int, dynamic) item) {
                final (index, value) = item;
                return GestureDetector(
                  onTap: () {
                    Provider.of<ListProvider>(context, listen: false)
                        .isOneButton = false;
                    Provider.of<ListProvider>(context, listen: false).index =
                        index;

                    context.go('/listedit');
                  },
                  child: Card(
                      child: Container(
                    color: Color(
                            Provider.of<ListProvider>(context, listen: false)
                                .randomColor[index])
                        .withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          value.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          Provider.of<ListProvider>(context, listen: false).getDescriptions[index].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )),
                );
              }),
            ]),
      )),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Provider.of<ListProvider>(context, listen: false).isOneButton = true;
          context.go('/listedit');
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add, size: 65),
      ),
    );
  }
}
