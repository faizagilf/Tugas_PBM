import 'package:flutter/material.dart';
import 'package:tugas4/model.dart';

class DetailPage extends StatelessWidget {
  final Warnet warnet;

  const DetailPage({
    super.key,
    required this.warnet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(warnet.gambar),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        warnet.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                            textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Text(
                            "${warnet.rating}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black),
                                textAlign: TextAlign.center,
                          ),
                          RichText(
                              text: WidgetSpan(
                                  child: Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 19,
                          )))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 40,
                        )),
                      ]),
                    ),
                    Text(
                      warnet.description,
                      style: TextStyle(
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.door_back_door_outlined,
                            color: Colors.black,
                            size: 30,
                          )),
                        ]),
                      ),
                    ),
                    Text(
                      warnet.open,
                      style: TextStyle(
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
