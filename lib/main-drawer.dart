import 'package:flutter/material.dart';
import 'package:my_app_ensias/gallery.dart';

import './quiz.dart';
import './weather.dart';
import './camera.dart';
import './apropos.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(

              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/logo.png"),),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepOrangeAccent,Colors.amberAccent])
            ),
          ),
          ListTile(
            title: Text("Quiz",style: TextStyle(fontSize: 15),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Quiz()));
            },),
          Divider(color: Colors.deepOrangeAccent,),
          ListTile(
            title: Text("Weather",style: TextStyle(fontSize: 15),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Weather()));
            },),
          Divider(color: Colors.deepOrangeAccent,),
          ListTile(
            title: Text("Gallery",style: TextStyle(fontSize: 15),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Gallery()));
            },),
          Divider(color: Colors.deepOrangeAccent,),
          ListTile(
            title: Text("Camera",style: TextStyle(fontSize: 15)),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Camera()));
            },),
          Divider(color: Colors.deepOrangeAccent,),
          ListTile(
            title: Text("A propos",style: TextStyle(fontSize: 15),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Apropos()));
            },)
        ],
      ),
    );
  }
}
