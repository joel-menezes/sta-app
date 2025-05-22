import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class WelcomeBanner extends StatefulWidget {
  final String? name;
  const WelcomeBanner({Key? key, this.name}) : super(key: key);

  @override
  _WelcomeBannerState createState() => _WelcomeBannerState();
}

class _WelcomeBannerState extends State<WelcomeBanner> {
  bool loading = true;
  User? _user;
  late final Stream<User?> authState;
  int? dayNumber;
  String errorMessage = '';
  String? name;

  @override
  void initState() {
    super.initState();
    authState = FirebaseAuth.instance.authStateChanges();
    authState.first.then((user) {
      setState(() {
        _user = user;
        print(_user);
        if (_user?.displayName == null || _user?.displayName == '' || _user?.displayName == ' '){
          name = 'to St. Augustine';
        }else{
          name = _user?.displayName ?? 'to St. Augustine';
        }
      });
      fetchDayNumber();
    });
  }

  Future<void> fetchDayNumber() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-staugustinechsapp.cloudfunctions.net/getDayNumber'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dayNumber = data['data']
              ['dayNumber']; // Extract the day number from the API response
          loading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load day number. Status code: ${response.statusCode}';
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
    DateTime now = DateTime.now();
    String date = DateFormat('MMMM d, y').format(now);

    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
            color: Styles.primary,
            border: Border.all(color: Styles.secondary, width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
              elevation: 0,
              color: Color(0xFF8D1230),
              child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width > 650
                                  ? MediaQuery.sizeOf(context).width / 4
                                  : MediaQuery.sizeOf(context).width / 2,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Welcome ' +
                                        (name ?? "to St. Augustine") +
                                        '!',
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(color: Colors.white),
                                    softWrap: true,
                                  ),
                                  Container(height: 10.0),
                                  Text(
                                      'Today is a beautiful day ${dayNumber != null ? dayNumber.toString() : '0'}, ' +
                                          date,
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(color: Colors.white))
                                ],
                              )),
                          const Spacer(),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 200.0),
                            width: widths / 3,
                            child: Image.asset('assets/logos/sta_logo.png',
                                fit: BoxFit.fitHeight),
                          ),
                        ]),
                      ]))))
    ]);
  }
}
