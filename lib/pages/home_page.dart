import 'package:flutter/material.dart';
import 'package:movies_app/api/MovieService.dart';
import 'package:movies_app/consts/URL_consts.dart';
import 'package:movies_app/model/movie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes a serem lançados"),
        centerTitle: false,
      ),
      body: _moviesList(),
    );
  }

  Widget _moviesList() {
    return FutureBuilder(
      builder: (context, moviesSnap) {
        if (!moviesSnap.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Movie> moviesList = moviesSnap.data;
          return Container(
            padding: EdgeInsets.all(16),
            child: _moviesListView(moviesList),
          );
        }
      },
      future: MovieService.getMoviesList(),
    );
  }

  _moviesListView(List<Movie> moviesList) {
    return ListView.builder(
      itemCount: moviesList != null ? moviesList.length : 0,
      itemBuilder: (context, index) {
        Movie m = moviesList[index];

        return Card(
          color: Colors.grey[100],
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(
                    ImagesURL + m.posterPath,
                    width: 150,
                  ),
                ),
                Text(
                  m.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  m.overview,
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
                        /* ... */
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
    );
  }
}
