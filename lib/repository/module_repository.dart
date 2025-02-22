import 'dart:convert';
import 'package:empireone_mart/app/model/module_model.dart';
import 'package:empireone_mart/repository/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModuleRepository {
  // 192.168.10.43:8000
  final String endPoint = "${apiUrl}/api/booklet";

  Future<List<ModuleModel>> fetchModules() async {
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((res) => ModuleModel.fromJson(json.encode(res)))
          .toList();
    } else {
      // Handle non-200 status codes
      print('Failed to load res. Status code: ${response.statusCode}');
      return [];
    }
  }

  Future getModuleById(String id) async {
    final response = await http.get(Uri.parse('${endPoint}/${id}'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body)['data'];
      if (jsonResponse != null) {
        return ModuleModel.fromJson(json.encode(jsonResponse));
      } else {
        print('No data found');
        return null; // Return null if no data found
      }
    } else {
      print('Failed to load response. Status code: ${response.statusCode}');
      return null;
    }
  }

  Future getScore(String id, String type) async {
    final prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');

    print('dsasdasdadsasdasdassssss${id}/${type}/${user_id}');
    final response = await http.get(
        Uri.parse('${apiUrl}/api/get_score/${id}/${type}?user_id=${user_id}'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('badodoododo${jsonResponse}');
      if (jsonResponse != null) {
        return json.encode(jsonResponse);
      } else {
        return null; // Return null if no data found
      }
    } else {
      print('Failed to load response. Status code: ${response.statusCode}');
      return null;
    }
  }

  Future<List<ModuleModel>> getModuleByQuarter(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');

    // print('dsasdasdadsasdasda{${user_id}}');
    final response = await http
        .get(Uri.parse('${endPoint}/quarter/${id}?user_id=${user_id}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['data'];
      print('ssssssssssssssss${jsonResponse}');
      return jsonResponse
          .map((res) => ModuleModel.fromJson(json.encode(res)))
          .toList();
    } else {
      print('Failed to load response. Status code: ${response.statusCode}');
      return [];
    }
  }
}
