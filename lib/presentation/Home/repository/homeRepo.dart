import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/presentation/Home/model/homeModel.dart';

class HomeRepo {
  final String apiurl = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Homemodel>> fetchData() async {
  final Response = await http.get(Uri.parse(apiurl));
  if (Response.statusCode == 200) {
    // Decode the response body which is a JSON string
    List jsonResponse = json.decode(Response.body);
    // Now map each JSON item to Homemodel using fromJson
    return jsonResponse.map((post) => Homemodel.fromJson(json.encode(post))).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
}
