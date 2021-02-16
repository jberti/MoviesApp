import 'dart:convert';

import 'package:flutter/material.dart';
import 'api/MovieService.dart';
import 'consts/URL_consts.dart';
import 'model/movie.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: _homePage(),
    );
  }

  _homePage(){
    return Scaffold(
        appBar: AppBar(
          title: Text("Filmes"),
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
            child: ListView.builder(
                itemCount: moviesList != null ? moviesList.length : 0,
                itemBuilder: (context, index) {
                  return _itemView(moviesList, index);
                }),
          );
        }
      },
      future: MovieService.getMoviesList(),
    );
  }

  _itemView(List<Movie> moviesList, int index) {
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
                ImagesURL+m.posterPath,
                width: 150,
              ),
            ),
            Text(
              m.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 25),
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
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            )


          ],
        ),
      ),
    );
  }
}
