import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/widgets/home/food_tile.dart';
import 'dart:io';

class CafeItems extends StatelessWidget {
  final Function(int) changeTab;
  const CafeItems({Key? key, required this.changeTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 24
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    double heights = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
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
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Featured Cafe Items',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary),
                          softWrap: true,
                        ),
                      ),
                      const Spacer(),
                      Container(
                          height: null,
                          width: null,
                          decoration: BoxDecoration(
                            color: Color(0xFFD8AE1A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 1.0, left: 1.0, right: 1.0, bottom: 1.0),
                              child: TextButton(
                                  onPressed: () {
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const SongPage()),
                                    // );
                                    changeTab(1);
                                  },
                                  child: Text(
                                    'View More >',
                                    style: new TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  )))),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0;
                            i < 3;
                            i++) // Only do 3 food items, for space reasons
                          FoodTile(
                              name: food[i],
                              heights: heights,
                              widths: widths * 0.3 - 12,
                              price: "32.00"),
                      ])
                ])),
          )),
    ]);
  }
}
