import 'dart:convert';
import 'package:http/http.dart';
import 'dart:async';
import '../models/movie_list_model.dart';

class MovieApiRequest {
  Client client = Client();
  final _apiKey = '3c27aae4ad7387c7f73a9a2361e4fac8';

  Future<MovieList> searchForMovie(String searchQuery) async {
    final response = await client
        .get("https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$searchQuery");
    if(response.statusCode == 200){
      return MovieList.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}