import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetail extends StatefulWidget {
  String ville;
  WeatherDetail(this.ville);
  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  var weatherData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.ville);
  }

  getData(String city) {
    String url =
        "http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=325bbf823a715b66cabae002ff71d5d8&units=metric";
    http.get(url).then((response) {
      setState(() {
        this.weatherData = json.decode(response.body);
        print("*********************");
        print(weatherData['list'][0]['weather'][0]['main']
            .toString()
            .toLowerCase());
        print(weatherData);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("weather of ${widget.ville}"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: (weatherData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    (weatherData == null ? 0 : weatherData['list'].length),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.deepOrangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "images/${weatherData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                                radius: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))}",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${new DateFormat('HH-mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))}"
                                      "| ${weatherData['list'][index]['weather'][0]['main']}",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                              "${weatherData['list'][index]['main']['temp'].round()}°C",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
