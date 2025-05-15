// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:home_widget/home_widget.dart';

// class WidgetHelper {
//   /// Fetches the day number from your cloud function
//   static Future<void> fetchDayNumber({
//     required Function(int dayNumber) onSuccess,
//     required Function(String errorMessage) onError,
//   }) async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://us-central1-staugustinechsapp.cloudfunctions.net/getDayNumber'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final int dayNumber = data['data']['dayNumber'];
//         onSuccess(dayNumber);
//       } else {
//         onError(
//             'Failed to load day number. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       onError('Error: ${e.toString()}');
//     }
//   }

//   /// Sends a string value to the Android home screen widget
//   static Future<void> sendValueToWidget(String myValue) async {
//     await HomeWidget.saveWidgetData('my_key', myValue);
//     await HomeWidget.updateWidget(
//       name: 'WidgetSmallProvider',
//     );
//   }
// }
