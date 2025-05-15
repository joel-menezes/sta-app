import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/widgets/menu/menu_items.dart';
import 'package:staapp/widgets/home/food_tile.dart';
import 'dart:io';

class CafeItems extends StatefulWidget {
  final Function(int) changeTab;
  const CafeItems({Key? key, required this.changeTab}) : super(key: key);

  @override
  State<CafeItems> createState() => _CafeItemsState();
}

class _CafeItemsState extends State<CafeItems> {
  late Function(int) changeTab;
  List<MenuItem> items = [];

  bool loading = true;
  String errorMessage = '';

  Future<void> fetchFoodItems() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-staugustinechsapp.cloudfunctions.net/getCafeMenuItems'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          for (var item in data['data']) {
            items.add(
                  new MenuItem(item['name'], item['price'].toStringAsFixed(2),
                  item['pictureUrl'],
                  item['isTodaysSpecial']));
          }

          loading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load announcments. Status code: ${response.statusCode}';
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    changeTab = widget.changeTab;
    fetchFoodItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 24
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    double heights = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
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
                        for (int i = 0; i < items.length && i < 3; i++)
// Only do 3 food items, for space reasons

                          FoodTile(
                              item: items[i],
                              heights: heights,
                              widths: widths * 0.3 - 12,
                             ),
                      ])
                ])),
          )),
    ]);
  }
}
