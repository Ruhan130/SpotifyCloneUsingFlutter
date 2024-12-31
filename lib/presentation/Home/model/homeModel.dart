import 'dart:convert';

class Homemodel {
  final int userId;
  final int id;
  final String? title; // Nullable String
  final String? body;  // Nullable String

  Homemodel({
    required this.userId,
    required this.id,
    this.title,  // Optional, can be null
    this.body,   // Optional, can be null
  });

  // Constructor to create Homemodel from JSON
  factory Homemodel.fromJson(Map<String, dynamic> json) {
    return Homemodel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],  // No need to assign a default value, just accept null
      body: json['body'],    // No need to assign a default value, just accept null
    );
  }
  // Method to convert object to map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title, // Can be null
      'body': body,   // Can be null
    };
  }

  // Convert object to JSON string
  String toJson() => json.encode(toMap());
}
