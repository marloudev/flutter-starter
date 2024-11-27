import 'dart:convert';
import 'package:empireone_mart/app/engagement/home/model/rewards_model.dart';
import 'package:http/http.dart' as http;

class RewardsRepository {
  final String apiUrl = "http://192.168.194.66:8000/api/rewards";

  Future<List<RewardsModel>> fetchRewards() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['status'];
      return jsonResponse
          .map((rewards) => RewardsModel.fromJson(json.encode(rewards)))
          .toList();
    } else {
      // Handle non-200 status codes
      print('Failed to load rewardss. Status code: ${response.statusCode}');
      return [];
    }
  }
}
