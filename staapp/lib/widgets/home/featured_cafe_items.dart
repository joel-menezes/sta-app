import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/widgets/home/food_tile.dart';


class CafeItems extends StatelessWidget {
  const CafeItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 24
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    double heights = MediaQuery.sizeOf(context).height;
    List<String> food = ["Fries", "Chicken Burger", "Burger With Fries"];
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
              boxShadow: Styles.normalBoxShadow,
              borderRadius: Styles.primaryBorderRadius),
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
                            fontSize: 15,
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
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MenuPage()),
                                          );
                                        },
                                        child: Text(
                                          'View More >',
                                          style: new TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        )))),
                          ])
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < food.length; i ++)
                          FoodTile(name: food[i], heights: heights, widths: widths),
                        
                      ])
                ])),
          )),
    ]);
  }
}


// Container(
//                             margin: const EdgeInsets.all(3.0),
//                             width: widths * 0.3 - 12,
//                             height: 150 / 600 * heights,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color(0xFF8D1230), width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Card(
//                               color: Colors.white,
//                               child: Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text('Fries',
//                                             textAlign: TextAlign.center,
//                                             style: new TextStyle(
//                                               fontSize: 10,
//                                               color: Color(0xFF8D1230),
//                                               fontWeight: FontWeight.bold,
//                                             )),
//                                       ])),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.all(3.0),
//                             width: widths * 0.3 - 12,
//                             height: 150 / 600 * heights,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color(0xFF8D1230), width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Card(
//                               color: Colors.white,
//                               child: Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text('Chicken Burger',
//                                             textAlign: TextAlign.center,
//                                             style: new TextStyle(
//                                               fontSize: 10,
//                                               color: Color(0xFF8D1230),
//                                               fontWeight: FontWeight.bold,
//                                             )),
//                                       ])),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.all(3.0),
//                             width: widths * 0.3 - 12,
//                             height: 150 / 600 * heights,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color(0xFF8D1230), width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Card(
//                               color: Colors.white,
//                               child: Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text('Burger With Fries',
//                                             textAlign: TextAlign.center,
//                                             style: new TextStyle(
//                                               fontSize: 10,
//                                               color: Color(0xFF8D1230),
//                                               fontWeight: FontWeight.bold,
//                                             )),
//                                       ])),
//                             )),