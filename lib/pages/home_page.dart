import 'package:flutter/material.dart';
import 'package:movies_app/api/MovieService.dart';
import 'package:movies_app/consts/URL_consts.dart';
import 'package:movies_app/control/user_control.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/model/user.dart';
import 'package:movies_app/pages/home_page_drawer.dart';
import 'package:movies_app/pages/movies_listview.dart';

class HomePage extends StatelessWidget {
  UserControl userControl;

  @override
  Widget build(BuildContext context) {
    userControl = UserControl();
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes a serem lançados"),
        centerTitle: false,
      ),
      body: MoviesListview(),
      drawer: HomePageDrawer(userControl.CurrentUser()),
    );

  }




}
