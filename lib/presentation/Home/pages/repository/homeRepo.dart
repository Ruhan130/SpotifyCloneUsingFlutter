import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/presentation/Home/model/homeModel.dart';

class homeRepo{
  final String apiurl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Homemodel>> fetchData() async {
    // ignore: non_constant_identifier_names
    final Response = await http.get(Uri.parse(apiurl));
    if(Response.statusCode == 200){
      List jsonResponse = json.decode(Response.body);
      return jsonResponse.map((post)=> Homemodel.fromJson(post)).toList();
      print(jsonResponse);
    }
    else{
      throw Exception('Failed to load posts');
    }
  } 


}
