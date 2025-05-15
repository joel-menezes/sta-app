import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchAndStoreDayNumber() async {
  try {
    final response = await http.get(Uri.parse(
        'https://us-central1-staugustinechsapp.cloudfunctions.net/getDayNumber'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      int dayNumber = data['data']['dayNumber'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('dayNumber', dayNumber);
    } else {
      print('Failed to fetch data. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
