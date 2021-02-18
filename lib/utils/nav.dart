import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page){
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    return page;
  }));
}

pop(BuildContext context, String message){
  Navigator.pop(context, message);
}