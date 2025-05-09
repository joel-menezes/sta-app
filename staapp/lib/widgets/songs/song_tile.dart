import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/widgets/songs/song_voting.dart';
import 'package:staapp/widgets/songs/song.dart';
import 'dart:io';

class SongTile extends StatefulWidget {
  final Song song;
  final void Function(Song) onVote;
  const SongTile({Key? key, required this.song, required this.onVote})
      : super(key: key);

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  late Song song;

  @override
  void initState() {
    super.initState();
  }

  void _addVote() {
    widget.onVote(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double widths = MediaQuery.sizeOf(context).width - 0;

    return Column(children: [
      Container(
        width: widths,
        height: null,
        margin:
            const EdgeInsets.only(top: 5.0, left: 1.0, right: 1.0, bottom: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8D1230), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
            onPressed: () {
              _addVote();
            },
            style: TextButton.styleFrom(
                backgroundColor: Styles.primary,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                )),
            child: Row(children: [
              Container(
                  width: 60,
                  height: null,
                  decoration: const BoxDecoration(
                      color: Color(0xFF8D1230),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(19),
                        bottomLeft: Radius.circular(19),
                      )),
                  child: Column(
                      children:
                          widget.song.hasVoted("joel.menezes25@ycdsbk12.ca")
                              ? [
                                  const Center(
                                      child: Icon(Icons.arrow_drop_up,
                                          color: Colors.amber, size: 24)),
                                  Text(
                                    widget.song.votes.length.toString(),
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(color: Colors.amber),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ]
                              : [
                                  const Center(
                                      child: Icon(Icons.arrow_drop_up,
                                          color: Colors.white, size: 24)),
                                  Text(
                                    widget.song.votes.length.toString(),
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ])),
              Expanded(
                  child: Container(
                      height: null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(19)),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.song.name,
                              style: theme.textTheme.displayLarge
                                  ?.copyWith(color: Styles.primary),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "By: " + widget.song.artist,
                              style: theme.textTheme.bodyLarge
                                  ?.copyWith(color: Styles.primary),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ])))
            ])),
      )
    ]);
  }
}
