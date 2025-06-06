import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:staapp/widgets/home/info_box.dart';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool loading = true;
  String errorMessage = '';

  List<String> name = [];
  List<String> message = [];

  Future<void> fetchAnnouncments() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('newGeneralAnnouncements')
        .get();

    for (var doc in snapshot.docs) {
      var datastore = doc.data() as Map<String, dynamic>;
      print(datastore);
      try {
        setState(() {
          name.add(datastore['title']);
          message.add(datastore['content']);
        });
      } catch (e) {
        print("error $e");
      }
    }
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchAnnouncments();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (mounted) {
        _currentPage = (_currentPage + 1) % message.length;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - Styles.phonePadding
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    bool isLargeScreen = MediaQuery.of(context).size.width == 1920;

    return Column(children: [
      Container(
          margin: const EdgeInsets.only(
              top: Styles.phonePadding,
              left: Styles.phonePadding,
              right: Styles.phonePadding),
          width: widths,
          height: null,
          decoration: BoxDecoration(
              boxShadow: Styles.normalBoxShadow,
              borderRadius: Styles.primaryBorderRadius),
          child: Card(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(Styles.phonePadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Announcements Board',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      // for (int i = 0; i < 1; i++)
                      // InfoBox(name: name[i], message: message[i])
                      SizedBox(height: 10),
                      Container(
                        height: isLargeScreen ? 380 : null,
                        child: isLargeScreen
                            ? PageView.builder(
                                controller: _pageController,
                                itemCount: message.length,
                                itemBuilder: (context, index) {
                                  return InfoBox(
                                      name: name[index],
                                      message: message[index]);
                                },
                              )
                            : Column(
                                children: [
                                  for (int i = 0; i < name.length; i++)
                                    InfoBox(name: name[i], message: message[i]),
                                ],
                              ),
                      ),
                    ])),
          )),
    ]);
  }
}
