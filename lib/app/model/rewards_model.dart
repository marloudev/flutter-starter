import 'dart:convert';

class RewardsModel {
  final String site;
  final String name;
  final String description;
  final int points_equivalent;
  final int quantity;

  RewardsModel(
      {required this.site,
      required this.name,
      required this.description,
      required this.points_equivalent,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'site': site,
      'name': name,
      'description': description,
      'points_equivalent': points_equivalent,
    };
  }

  factory RewardsModel.fromMap(Map<String, dynamic> map) {
    return RewardsModel(
      site: map['site'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      points_equivalent: map['points_equivalent'] ?? 0,
      quantity: map['quantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  // Optionally, you can add a factory constructor for creating an instance from JSON
  factory RewardsModel.fromJson(String source) =>
      RewardsModel.fromMap(json.decode(source));
}
