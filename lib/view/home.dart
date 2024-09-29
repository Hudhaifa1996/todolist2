import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final SharedPreferences prefs;

  const Home({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    VmHome(prefs, context);
    List<int> randomColor =
        Provider.of<listProvider>(context, listen: false).randomColor;
    List<String>? miniCard1 =
        Provider.of<listProvider>(context, listen: false).getCard1;
    List<String>? miniCard2 =
        Provider.of<listProvider>(context, listen: false).getCard2;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...miniCard1!.map((item) => GestureDetector(
                    onTap: () {
                      Provider.of<listProvider>(context, listen: false).buttonsNo = 0;
                      Provider.of<listProvider>(context, listen: false).index =
                          miniCard1.indexOf(item);

                      Navigator.pushNamed(context, '/listedit');
                    },
                    child: Card(
                        child: Container(
                      color: Color(randomColor[miniCard1.indexOf(item)])
                          .withOpacity(0.5),
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
                            miniCard2![miniCard1.indexOf(item)].toString(),
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

          Provider.of<listProvider>(context, listen: false).buttonsNo = 1;
          Navigator.pushNamed(context, '/listedit');
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add, size: 65),
      ),
    );
  }
}
