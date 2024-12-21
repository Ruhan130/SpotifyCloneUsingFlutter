// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Homemodel {
  final int id;
  final String tittle;
  final String body;

  Homemodel({required this.id, required this.tittle, required this.body});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'body': body,
    };
  }

  factory Homemodel.fromMap(Map<String, dynamic> map) {
    return Homemodel(
      id: map['id'] as int,
      tittle: map['tittle'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Homemodel.fromJson(String source) => Homemodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
