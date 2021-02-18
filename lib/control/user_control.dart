import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:movies_app/model/user.dart';

class UserControl{
  User user;
  User CurrentUser(){
    if (user == null){
      user = User();
      user.name = "Jorge Berti";
      user.email = "jb@email.com";
      user.userIcon = "https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png";
    }
    return user;
  }
}