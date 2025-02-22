import 'dart:convert';
import 'package:empireone_mart/repository/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  // API endpoint
  final String endPoint = "${apiUrl}/api/user";

  Future get_user() async {
    // Retrieve the token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // prefs.remove('token');
    print('token${token}');
    try {
      // Send a GET request with Bearer token in the headers
      final response = await http.get(
        Uri.parse(endPoint),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('jsonResponse');
        return 'success';
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}
