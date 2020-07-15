import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent,),
      body: Center(
        child: Text("A propos",style: TextStyle(fontSize: 22,color: Colors.blue)),
      ),
    );
  }
}


