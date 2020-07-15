import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './weather-details.dart';
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String ville="";
  TextEditingController textEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ville),backgroundColor: Colors.deepOrangeAccent,),
      body:Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Taper une ville',),
                style: TextStyle(fontSize: 20),
                controller: textEditingController,
                onChanged: (value){
                  setState(() {
                    this.ville=value;
                  });
                },
                onSubmitted: (value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(ville)));
                  textEditingController.text="";
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton(

                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: Text("Get weather", style: TextStyle(fontSize: 22,color: Colors.white),),
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(ville)));
                    textEditingController.text="";

                  },

          ),
              )
          )
        ],
      ),
    );
  }
}


