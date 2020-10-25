import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  bool pageControll = false;
  Text desc;
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFA37EBA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "CAMPAING",
          style: TextStyle(color: Color(0xFF4C4C4C)),
        ),
      ),
      body: Container(
        width: wSize,
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/campaing.json'),
            builder: (context, snapshot) {
              var mydata = jsonDecode(snapshot.data.toString());
              return Container(
                width: wSize,
                height: hSize * 0.35,
                child: PageView.builder(
                    itemCount: mydata == null ? 0 : mydata.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF4C4C4C),
                        ),
                        width: wSize,
                        height: 0.35,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10.0),
                              width: wSize,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(mydata[index]['image']),
                                ),
                              ),
                            ),
                            Text(
                              mydata[index]['title'],
                              style: TextStyle(
                                  color: Color(0xFFA37EBA),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                mydata[index]['description'],
                                style: TextStyle(
                                    color: Color(0xFFA37EBA), fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );

            }),
      ),
    );
  }
}
