import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String apiUrl = "https://empireone-finance.com/login";

  Future<List<dynamic>> authLogin(String email, String password) async {
    try {
      Map<String, String> body = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );

      // print('success${response.statusCode}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to authenticate. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }
}
