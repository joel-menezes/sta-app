import 'package:flutter/material.dart';
import 'dart:io';

class CafeItems extends StatelessWidget {
  const CafeItems({Key? key}) : super(key: key);
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
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Featured Cafe Items',
                          style: new TextStyle(
                            fontSize: 20,
                            color: Color(0xFF8D1230),
                            fontWeight: FontWeight.bold,
                          )),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                height: null,
                                width: null,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD8AE1A),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0,
                                        left: 5.0,
                                        right: 5.0,
                                        bottom: 5.0),
                                    child: Text('View More >',
                                        style: new TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        )))),
                          ])
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 100.0,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF8D1230), width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Fries',
                                            textAlign: TextAlign.center,
                                            style: new TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF8D1230),
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                          '.',
                                          style: new TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF8D1230),
                                          ),
                                          softWrap: true,
                                        ),
                                      ])),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 100.0,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF8D1230), width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Chicken Burger',
                                            textAlign: TextAlign.center,
                                            style: new TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF8D1230),
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                          '.',
                                          style: new TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF8D1230),
                                          ),
                                          softWrap: true,
                                        ),
                                      ])),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 100.0,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF8D1230), width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Burger With Fries',
                                            textAlign: TextAlign.center,
                                            style: new TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF8D1230),
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                          '.',
                                          style: new TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF8D1230),
                                          ),
                                          softWrap: true,
                                        ),
                                      ])),
                            )),
                      ])
                ])),
          )),
    ]);
  }
}
