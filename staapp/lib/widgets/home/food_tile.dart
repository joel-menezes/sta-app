import 'package:flutter/material.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'dart:io';

class FoodTile extends StatelessWidget {
  final String name;
  final double heights;
  final double widths;
  final String? price;

  const FoodTile(
      {Key? key,
      required this.name,
      required this.heights,
      required this.widths,
      this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        margin: const EdgeInsets.all(0),
        width: widths,
        height: 150 / 600 * heights,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8D1230), width: 2),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: Color(0xFF8D1230), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage('assets/placeholders/unavailable-image.png'),
                  fit: BoxFit.cover,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (price == null || price!.isEmpty)
                          ? Text(name,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Styles.primary,
                                  fontWeight: FontWeight.bold))
                          : Text('\$${price}',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Styles.primary,
                                  fontWeight: FontWeight.bold)),
                    ])),
          ),
        ));
  }
}
