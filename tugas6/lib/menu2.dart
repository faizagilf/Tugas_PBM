import 'package:flutter/material.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/iphone14pro.png')),
                shape: BoxShape.circle),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Card(
              elevation: 16,
              child: ListTile(
                title: Text(
                  "Iphone 14 Pro 2022",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Card(
              elevation: 16,
              child: ListTile(
                title: Text(
                  "A16 Bionic Chip",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Card(
              elevation: 16,
              child: ListTile(
                title: Text(
                  "Deep Purple",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
