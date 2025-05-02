import 'package:staapp/widgets/home/info_box.dart';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/widgets/songs/song_tile.dart';
import 'dart:io';

class SongRequests extends StatelessWidget {
  const SongRequests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    List<String> name = ["One Dance", "Feel No Ways", "Views", "Hello"];
    List<String> message = ["By: Drake", "By: Drake", "By: Drake", "By: Adele"];

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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Song Requests Board',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Styles.secondary,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(widths, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              )),
                          child: Text(
                            'Add Song',
                            style: new TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(height: 10),
                      for (int i = 0; i < name.length; i++)
                        SongTile(name: name[i], message: message[i])
                    ])),
          )),
    ]);
  }
}
