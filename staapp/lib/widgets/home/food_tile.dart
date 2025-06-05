import 'package:flutter/material.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'dart:io';
import 'package:staapp/widgets/menu/menu_items.dart';

class FoodTile extends StatelessWidget {
  final MenuItem item;
  final double heights;
  final double widths;

  const FoodTile(
      {Key? key,
      required this.heights,
      required this.widths,
      required this.item})
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
                  image: NetworkImage(item.url ??
                      'https://storage.googleapis.com/staugustinechsapp.appspot.com/newCafeMenuItems/Unavailable%20Image.jpg?GoogleAccessId=staugustinechsapp%40appspot.gserviceaccount.com&Expires=1747867466&Signature=W7RcP0OAAm29V%2BJddAY%2F88TNEUGbU0nn78q6CdOUoN5uD2qtHr07b36yz227X%2F1sHwOEqtn5F%2BtTBaO7GGsIJtEeg9WWBAxTOHEQmYFVpBGKdHVKkmLF5qH%2Bka2VhsJpBtlr22cnxDfK6SRboDPaa4cWXHt05CwGr55nLf9B67T2xApf3EJUubLkzL273gKP1ib4i9W6DkAV0PPyyhwasWBEsimbFhU8eip1g85XdpK4OSgGVY2j14ENr6VTwABEKJK4AHjCp7vJJqKE%2Frm1lb5EgI%2B2qvwY2YX75M0tQjD5YXawLidVedHxC4oFdz3xDwirKgI3xgQmtdj6cLgrsg%3D%3D'),
                  // AssetImage('assets/placeholders/unavailable-image.png'),
                  fit: BoxFit.cover,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (item.price == null ||
                              item.price!.isEmpty ||
                              item.price == "null")
                          ? Text(item.name,
                              textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,

                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Styles.primary,
                                  fontWeight: FontWeight.bold))
                          : Text(item.name,
                              textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,

                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Styles.primary,
                                  fontWeight: FontWeight.bold)),
                      Text('\$${item.price}',
                          textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,

                          style: theme.textTheme.bodyLarge?.copyWith(
                              color: Styles.primary,
                              fontWeight: FontWeight.bold)),
                    ])),
          ),
        ));
  }
}
