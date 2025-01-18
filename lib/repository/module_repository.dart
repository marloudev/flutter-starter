import 'dart:convert';
import 'package:empireone_mart/app/model/module_model.dart';
import 'package:http/http.dart' as http;

class ModuleRepository {
  final String apiUrl = "http://192.168.115.184:8000/api/booklet";

  Future<List<ModuleModel>> fetchModules() async {
    final response = await http.get(Uri.parse(apiUrl));
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
    final response = await http.get(Uri.parse('${apiUrl}/${id}'));
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
}
