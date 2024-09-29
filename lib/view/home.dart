import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    VmHome(context);
    List<int> randomColor =
        Provider.of<ListProvider>(context, listen: false).randomColor;
    List<String>? miniCard1 =
        Provider.of<ListProvider>(context, listen: false).getCard1;
    List<String>? miniCard2 =
        Provider.of<ListProvider>(context, listen: false).getCard2;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...miniCard1!.mapIndexed((index, item) => GestureDetector(
                    onTap: () {
                      Provider.of<ListProvider>(context, listen: false)
                          .buttonsNo = 0;
                      Provider.of<ListProvider>(context, listen: false).index =
                          index;

                      context.go('/listedit');
                    },
                    child: Card(
                        child: Container(
                      color: Color(randomColor[index]).withOpacity(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            item,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            miniCard2![index].toString(),
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
                  )),
            ]),
      )),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Provider.of<ListProvider>(context, listen: false).buttonsNo = 1;
          context.go('/listedit');
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add, size: 65),
      ),
    );
  }
}
