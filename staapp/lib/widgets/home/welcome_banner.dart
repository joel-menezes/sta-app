import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({Key? key}) : super(key: key);
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
            color: Styles.primary,
            border: Border.all(color: Styles.secondary, width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
              color: Color(0xFF8D1230),
              child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                              width: 180,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Welcome Joel Menezes!',
                                    style:  theme.textTheme.displayLarge
                              ?.copyWith(color: Colors.white),
                                    softWrap: true,
                                  ),
                                  Container(height: 10.0),
                                  Text(
                                      'Today is a beautiful day 1, November 12, 2024',
                                      style: theme.textTheme.bodyLarge
                              ?.copyWith(color: Colors.white))
                                ],
                              )),
                          const Spacer(),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 200.0),
                            width: 100 / 350 * widths,
                            child: Image.asset('assets/logos/sta_logo.png',
                                fit: BoxFit.fitHeight),
                          ),
                        ]),
                      ])))),
    ]);
  }
}
