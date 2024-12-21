// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Homemodel {
  final int id;
  final String title;  // Fixed typo: "tittle" to "title"
  final String body;

  Homemodel({required this.id, required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Homemodel.fromMap(Map<String, dynamic> map) {
    return Homemodel(
      id: map['id'] as int,
      title: map['title'] as String,  // Fixed typo here too
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

 factory Homemodel.fromJson(String source) {
  try {
    var map = json.decode(source); // decode the string into a Map
    print(map); // print the map to see if it's correct
    return Homemodel.fromMap(map); // map to Homemodel
  } catch (e) {
    print('Error parsing JSON: $e');
    rethrow;
  }
}
}
