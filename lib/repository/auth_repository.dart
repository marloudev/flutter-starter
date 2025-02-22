import 'dart:convert';
import 'package:empireone_mart/repository/endpoint.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  // 192.168.10.43
  final String endPoint = "${apiUrl}/api/auth/login";

  Future<Map<String, dynamic>> authLogin(String email, String password) async {
    try {
      // Prepare the request body
      final Map<String, String> body = {
        "email": email,
        "password": password,
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(endPoint),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(body),
      );

      print('bodybody${response.statusCode}');
      // Handle the response
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse is Map<String, dynamic>) {
          return decodedResponse;
        } else {
          print('Unexpected response format: ${decodedResponse.runtimeType}');
          return {};
        }
      } else {
        print('Failed to authenticate. Status code: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      // Handle any errors
      print('An error occurred during authentication: $e');
      return {};
    }
  }
}
