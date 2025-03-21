import 'dart:convert';
import 'dart:ffi';

class ModuleModel {
  final int id;
  final String title;
  final String grade;
  final String wintn;
  final String introductory;
  final String quarter;
  final Object exam_type;
  final lessons;

  ModuleModel({
    required this.id,
    required this.title,
    required this.grade,
    required this.wintn,
    required this.introductory,
    required this.quarter,
    required this.exam_type,
    required this.lessons,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'grade': grade,
      'introductory': introductory,
      'wintn': wintn,
      'quarter': quarter,
      'lessons': lessons,
    };
  }

  factory ModuleModel.fromMap(Map<String, dynamic> map) {
    return ModuleModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      grade: map['grade'] ?? '',
      introductory: map['introductory'] ?? '',
      wintn: map['wintn'] ?? '',
      quarter: map['quarter'] ?? '',
      exam_type: map['exam_type'] ?? {},
      lessons: map['lessons'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  // Optionally, you can add a factory constructor for creating an instance from JSON
  factory ModuleModel.fromJson(String source) =>
      ModuleModel.fromMap(json.decode(source));
}
