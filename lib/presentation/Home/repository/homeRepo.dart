import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/presentation/Home/model/homeModel.dart';

class HomeRepo {
  final String apiurl = 'https://jsonplaceholder.typicode.com/albums';

Future<List<Homemodel>> fetchData() async {
  final Response = await http.get(Uri.parse(apiurl));
  
  if (Response.statusCode == 200) {
    print(Response.body);
    // Here, make sure to decode the response body into Map<String, dynamic>
    List<dynamic> jsonResponse = json.decode(Response.body);  // This will be a List of Maps
    
    // Now map it to Homemodel objects
    return jsonResponse.map((post) => Homemodel.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

}
// https://developer.spotify.com/documentation/web-api/reference/get-an-artist