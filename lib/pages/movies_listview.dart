import 'package:flutter/material.dart';
import 'package:movies_app/api/MovieService.dart';
import 'package:movies_app/consts/URL_consts.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/pages/movie_page.dart';
import 'package:movies_app/utils/nav.dart';

class MoviesListview extends StatefulWidget {

  @override
  _MoviesListviewState createState() => _MoviesListviewState();
}

class _MoviesListviewState extends State<MoviesListview> {
  List<Movie> movies;

  @override
  void initState(){
    super.initState();
    Future<List<Movie>> future = MovieService.getMoviesList();
    future.then((List<Movie> movies) {
      setState(() {
        this.movies = movies;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (movies == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return _moviesListView(movies);
  }

  _moviesListView(List<Movie> moviesList) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: moviesList != null ? moviesList.length : 0,
        itemBuilder: (context, index) {
          Movie movie = moviesList[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      ImagesURL + movie.posterPath,
                      width: 150,
                    ),
                  ),
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () {
                          push(context, MoviePage(movie));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
