import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
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
  List<String> name = [];
  List<String> price = [];
  List<String> url = [];

  bool loading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchFoodTiles();
    changeTab = widget.changeTab;
  }

  Future<void> fetchFoodTiles() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-staugustinechsapp.cloudfunctions.net/getCafeMenuItems'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          for (var item in data['data']) {
            print(item['name']);

            if (item['name'] != null) {
              name.add(item['name']);
              if (item['price'] != null) {
                price.add(item['price']);
              } else {
                price.add('2000');
              }
              if (item['pictureUrl'] != null) {
                url.add(item['pictureUrl']);
              } else {
                url.add(
                    'https://storage.googleapis.com/staugustinechsapp.appspot.com/newCafeMenuItems/Unavailable%20Image.jpg?GoogleAccessId=staugustinechsapp%40appspot.gserviceaccount.com&Expires=1747867466&Signature=W7RcP0OAAm29V%2BJddAY%2F88TNEUGbU0nn78q6CdOUoN5uD2qtHr07b36yz227X%2F1sHwOEqtn5F%2BtTBaO7GGsIJtEeg9WWBAxTOHEQmYFVpBGKdHVKkmLF5qH%2Bka2VhsJpBtlr22cnxDfK6SRboDPaa4cWXHt05CwGr55nLf9B67T2xApf3EJUubLkzL273gKP1ib4i9W6DkAV0PPyyhwasWBEsimbFhU8eip1g85XdpK4OSgGVY2j14ENr6VTwABEKJK4AHjCp7vJJqKE%2Frm1lb5EgI%2B2qvwY2YX75M0tQjD5YXawLidVedHxC4oFdz3xDwirKgI3xgQmtdj6cLgrsg%3D%3D');
              }
            }
          }

          loading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load food tiles. Status code: ${response.statusCode}';
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
                            i < name.length &&
                                i < price.length &&
                                i < url.length &&
                                i < 3;
                            i++)
// Only do 3 food items, for space reasons

                          FoodTile(
                              name: name[i],
                              heights: heights,
                              widths: widths * 0.3 - 12,
                              price: 'price[i]',
                              url: ' url[i]'),
                      ])
                ])),
          )),
    ]);
  }
}
