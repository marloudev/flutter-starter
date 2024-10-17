import 'dart:convert';

import 'package:empireone_mart/app/engagement/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<HomeModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((post) => HomeModel.fromJson(json.encode(post)))
          .toList();
    } else {
      // Handle non-200 status codes
      print('Failed to load posts. Status code: ${response.statusCode}');
      return [];
    }
  }
}
