import 'package:staapp/theme/styles.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column( children: [

        Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  width: 350.0,
                  height: null,
                  decoration: BoxDecoration(
                    color: Styles.primary,
                    border: Border.all(color: Styles.secondary, width: 5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                      color: Color(0xFF8D1230),
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  SizedBox(
                                    width: 190,
                                  child: Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                     Text(
                                      'Welcome Joel Menezes!',
                                      style: new TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      softWrap: true,
                                    ),
                                    Container(height: 10.0),
                                    Text(
                                        'Today is a beautiful day 1, November 12, 2024',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                  )),
                                  const Spacer(),
                                  Container(
                                    constraints: const BoxConstraints(maxHeight: 200.0),
                                    width: 110,
                                    child: Image.asset('assets/logos/sta_logo.png',
                    fit: BoxFit.fitHeight),
                                  ),

                                ]),

                              ])))),
    ]
    );
  }
  }