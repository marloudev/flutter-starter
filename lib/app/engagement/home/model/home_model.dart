import 'dart:convert';

class HomeModel {
  final int id;
  final String title;
  final String body;

  HomeModel({required this.id, required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // Optionally, you can add a factory constructor for creating an instance from JSON
  factory HomeModel.fromJson(String source) => HomeModel.fromMap(json.decode(source));
}
