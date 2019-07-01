import 'package:flutter/material.dart';
import 'package:text_field/second_screen/index.dart';
import 'package:text_field/first_screen/index.dart';
import 'package:text_field/third_screen/index.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter learn",
      home: Home(),
      routes: <String,WidgetBuilder>{
        '/second': (BuildContext context)=>MyCustomForm(),
        '/third': (BuildContext context)=>GetLocationPage(firstname : firstname),
      },
      );
  }
}