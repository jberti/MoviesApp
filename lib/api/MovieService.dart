import 'package:http/http.dart' as http;
import 'package:movies_app/consts/URL_consts.dart';
import 'dart:convert' as convert;

import 'package:movies_app/model/movie.dart';

class MovieService {

  static Future<List<Movie>> getMoviesList() async {
    var response = await http.get(MoviesURL);
    String json = response.body;

    List list =   convert.json.decode(json)['results'];

    final movies = List<Movie>();

    for (Map map in list){
      Movie m = Movie.fromJson(map);
      movies.add(m);
    }
    return movies;
    //return list.map<Movie>((map) => Movie.fromJson(map)).toList();
  }

  static Future GetMovieCover(String coverPath) async {
    var result = await http.get(ImagesURL + coverPath);
    return result;
  }
}
