import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_ensias/gallery.dart';
import 'package:my_app_ensias/main-drawer.dart';
import './quiz.dart';
import './weather.dart';
import './camera.dart';
import './apropos.dart';
import './main-drawer.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      drawer: MainDrawer(),
        appBar: AppBar(title: Text('First App'),backgroundColor: Colors.deepOrangeAccent,),
        body: Center(child: Text("Hello Ahmed in flutter",style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),)),

    );
  }

}