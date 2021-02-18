import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/user.dart';

class HomePageDrawer extends StatelessWidget {
  User _user;

  HomePageDrawer(this._user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_user.name),
              accountEmail: Text(_user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(_user.userIcon),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Em construção"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
