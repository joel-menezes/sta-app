import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/widgets/menu/menu_items.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuItem> specials = [];
  List<MenuItem> regulars = [];
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
            if (item['isTodaysSpecial'] == true){
              specials.add(
                  new MenuItem( item['name'],  item['price'].toStringAsFixed(2),
                   item['pictureUrl'],
                   item['isTodaysSpecial']));

            }
            else
              regulars.add(
                  new MenuItem( item['name'],  item['price'].toStringAsFixed(2),
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
    fetchFoodItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
        Header(name: "Cafeteria Menu"),
        Specials(items: specials), 
        Menu(items: regulars),
      ]))),
    );
  }
}
