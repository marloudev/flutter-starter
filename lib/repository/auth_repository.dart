import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String apiUrl = "http://192.168.115.184:8000/api/auth/login";

  Future<Map<String, dynamic>> authLogin(String email, String password) async {
    try {
      // Prepare the request body
      final Map<String, String> body = {
        "email": email,
        "password": password,
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(body),
      );

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
