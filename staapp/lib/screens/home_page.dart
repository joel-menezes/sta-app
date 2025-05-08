import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:staapp/widgets/home/welcome_banner.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/home/featured_cafe_items.dart';
import 'package:staapp/widgets/home/spirit_meter.dart';
import 'package:staapp/widgets/home/chaplaincy_corner.dart';
// import 'package:staapp/widgets/home/youtube_playlist.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  final Function(int) changeTab;
  const HomePage({super.key, required this.changeTab});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [
      WelcomeBanner(),
      Announcements(),
      CafeItems(changeTab: widget.changeTab),
      SpiritMeter(),
      ChaplaincyCorner(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < Styles.phoneWidth) {
          // Phone Size
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final widget = widgets.removeAt(oldIndex);
                    widgets.insert(newIndex, widget);
                  });
                },
                children: [
                  for (int index = 0; index < widgets.length; index++)
                    Container(
                      key: ValueKey(index),
                      child: widgets[index],
                    )
                ],
              ))
            ],
          );
        } else if (constraints.maxWidth == Styles.TVWidth) {
          return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WelcomeBanner(),
                            CafeItems(changeTab: widget.changeTab),
                            ChaplaincyCorner()
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Announcements(),
                          ]),
                    ])
              ]));
        } else {
          // Bigger than Phone
          return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WelcomeBanner(),
                            CafeItems(changeTab: widget.changeTab),
                            ChaplaincyCorner()
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Announcements(),
                            // YouTubePlaylistScreen(videoIds: ['dQw4w9WgXcQ', 'kxopViU98Xo', '3JZ_D3ELwOQ']),
                            SpiritMeter(),
                          ]),
                    ])
              ]));
        }
      }),
    );
  }
}
