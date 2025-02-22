import 'dart:convert';
import 'package:empireone_mart/repository/endpoint.dart';
import 'package:http/http.dart' as http;

class AnswerRepository {
  // 192.168.10.43
  final String endPoint = "${apiUrl}/api/answer";

  Future<Map<String, dynamic>> answerQuestion(
      String answer, student_id, quest_id) async {
    try {
      // Prepare the request body
      final body = {
        "answer": answer,
        "student_id": student_id,
        "quest_id": quest_id
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

      print('dadakjldabody${response.statusCode}');
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
