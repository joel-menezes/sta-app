import 'package:flutter/material.dart';
import 'dart:io';

class SpiritMeter extends StatelessWidget {
  const SpiritMeter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 350.0,
          height: null,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: 0.1,
                  blurStyle: BlurStyle.normal)
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spirit Meter',
                            style: new TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8D1230),
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('9',
                                  style: new TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF8D1230),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 12.0, left: 31),
                              width: 150.0,
                              height: null,
                              decoration: BoxDecoration(
                                color: Color(0xFF8D1230),
                                border: Border.all(
                                    color: Color(0xFFD8AE1A), width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('10',
                                  style: new TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF8D1230),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 12.0, left: 22),
                              width: 130.0,
                              height: null,
                              decoration: BoxDecoration(
                                color: Color(0xFF8D1230),
                                border: Border.all(
                                    color: Color(0xFFD8AE1A), width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('11',
                                  style: new TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF8D1230),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 12.0, left: 22),
                              width: 165.0,
                              height: null,
                              decoration: BoxDecoration(
                                color: Color(0xFF8D1230),
                                border: Border.all(
                                    color: Color(0xFFD8AE1A), width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('12',
                                  style: new TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF8D1230),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 12.0, left: 22),
                              width: 180.0,
                              height: null,
                              decoration: BoxDecoration(
                                color: Color(0xFF8D1230),
                                border: Border.all(
                                    color: Color(0xFFD8AE1A), width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        ),
                      ])))),
    ]);
  }
}
