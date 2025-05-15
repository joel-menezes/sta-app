import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/info_box.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class ChaplaincyCorner extends StatefulWidget {
  const ChaplaincyCorner({Key? key}) : super(key: key);

  @override
  State<ChaplaincyCorner> createState() => _ChaplaincyCornerState();
}

class _ChaplaincyCornerState extends State<ChaplaincyCorner> {
  String? verse;
  bool loading = true;
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    fetchVerseOfDay();
  }

  Future<void> fetchVerseOfDay() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-staugustinechsapp.cloudfunctions.net/getVerseOfDay'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          verse = data['data']['verseOfDay'];

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
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;
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
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Chaplaincy Corner',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      InfoBox(
                          name: "Verse of The Day",
                          message: (verse ??
                              'We may throw the dice, but the LORD determines how they fall. (Proverbs 16:33)')),
                    ])),
          ))
    ]);
  }
}
