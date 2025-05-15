import 'package:staapp/widgets/home/info_box.dart';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/widgets/songs/song.dart';
import 'package:staapp/widgets/songs/song_tile.dart';
import 'dart:collection';
import 'dart:io';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongRequests extends StatefulWidget {
  const SongRequests({Key? key}) : super(key: key);

  @override
  State<SongRequests> createState() => _SongRequestsState();
}

class _SongRequestsState extends State<SongRequests> {
  late List<Song> listOfSongs;
  final String userEmail = 'joel.menezes25@ycdsbk12.ca';
  final bool isLoggedIn = true;
  final TextEditingController songNameController = TextEditingController();
  final TextEditingController artistNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listOfSongs = [];

    getAllSongs();
    listOfSongs.sort();
  }

  @override
  void dispose() {
    songNameController.dispose();
    artistNameController.dispose();
    super.dispose();
  }

  void getAllSongs() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('newSongs').get();
    listOfSongs.clear();

    for (var doc in snapshot.docs) {
      var datastore = doc.data() as Map<String, dynamic>;
      print(datastore);
      try {
        Song song = Song(datastore['name'], datastore['artist'],
            List<String>.from(datastore['votes']), doc.id);

        setState(() {
          listOfSongs.add(song);
        });
      } catch (e) {
        print("error $e");
      }
    }
  }

  void _handleVote(Song song) {
    setState(() {
      if (isLoggedIn) {
        song.addVote(userEmail);
        listOfSongs.sort();
      }
    });
  }

  void _addSong(Song newSong) async {
    setState(() async {
      if (isLoggedIn) {
        listOfSongs.add(newSong);
        listOfSongs.sort();

        await FirebaseFirestore.instance.collection('newSongs').add({
          'artist': newSong.artist,
          'createdAt': FieldValue.serverTimestamp(),
          'creatorEmail': 'joel.menezes25@ycdsbk12.ca',
          'name': newSong.name,
          'votes': ['joel.menezes25@ycdsbk12.ca'],
        });
      }
      getAllSongs();
      listOfSongs.sort();
    });
  }

  void showAddSong() {
    final theme = Theme.of(context);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.amber),
                onPressed: () {
                  {
                    Navigator.pop(context);
                  }
                },
              )),
          Text("Add Song",
              style: theme.textTheme.bodyLarge?.copyWith(
                  color: Styles.secondary, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: songNameController,
              style: TextStyle(color: Styles.secondary),
              decoration: InputDecoration(
                labelText: 'Song Name',
                labelStyle: TextStyle(color: Styles.primary),
                hintText: 'Never Gonna Give You Up',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: artistNameController,
              style: TextStyle(color: Styles.secondary),
              decoration: InputDecoration(
                labelText: 'Artist Name',
                labelStyle: TextStyle(color: Styles.primary),
                hintText: 'Rick Astley',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              final songName = songNameController.text.trim();
              final artistName = artistNameController.text.trim();
              if (songName.isNotEmpty && artistName.isNotEmpty) {
                _addSong(
                    Song(songName, artistName, ["joel.menezes25@ycdsbk12.ca"]));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Submit', style: TextStyle(color: Colors.white)),
          )
        ])));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;

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
                          onPressed: () {
                            showAddSong(); // _addSong(Song("New Artist", "New Song", []));
                          },
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
                      for (Song song in listOfSongs)
                        SongTile(song: song, onVote: _handleVote)
                    ])),
          )),
    ]);
  }
}
