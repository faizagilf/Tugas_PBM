import 'package:flutter/material.dart';
import 'package:tugas4/detail.dart';
import 'package:tugas4/model.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: " i C A F E ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red, fontSize: 18),
            ),
            WidgetSpan(
                child: Icon(
              Icons.computer_outlined,
              color: Colors.red[500],
            ))
          ]),
        ),
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[500],
      body: SafeArea(
          child: ListView.builder(
        itemCount: listWarnet.length,
        itemBuilder: (context, index) {
          final item = listWarnet[index];
          return Padding(
            padding: EdgeInsets.all(3),
            child: Container(
              height: 80,
              child: Card(
                elevation: 10,
                child: Center(
                  child: ListTile(
                    title: Text(item.title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    leading: Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow[800],
                      child: Image.asset(
                        "${item.gambar}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "${item.rating}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      WidgetSpan(
                          child: Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 25,
                      ))
                    ])),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(warnet: item)),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
