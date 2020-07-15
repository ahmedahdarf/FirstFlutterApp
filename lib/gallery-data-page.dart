import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDataPage extends StatefulWidget {
  String keyWord;
  GalleryDataPage(this.keyWord);
  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1, size = 10;
  int totalPages;
  ScrollController _scrollController=new ScrollController();
  List<dynamic> hits=[];
  var galleryData;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.getData();
        }
      }
    });


  }

  getData() {
    String url =
        "https://pixabay.com/api/?key=12524072-79013d53833abdff4a324f00f&q=${widget.keyWord}&image_type=photo&pretty=true&page=${currentPage}&per_page=${size}";
    http.get(url).then((responce) {
      setState(() {
        galleryData = json.decode(responce.body);
        hits.addAll(galleryData['hits']);
        if(galleryData['totalHits']%size==0)
          totalPages=galleryData['totalHits']~/size;
        else
          totalPages=1+(galleryData['totalHits']/size).floor();
        print(hits);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("photo de ${widget.keyWord}    |   ${currentPage}/${this.totalPages} "),
      ),
      body: (galleryData == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: (galleryData == null) ? 0 : hits.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9,bottom: 9),
                          child: Center(
                            child: Text(
                              hits[index]['tags'],
                              style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        color: Colors.deepOrange,
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.only(left: 9,bottom: 9,right: 9),
                      child: Card(
                        child: Image.network(hits[index]['webformatURL'],fit: BoxFit.fitWidth,),
                      ),
                    )
                  ],
                );
              }),
    );
  }
}
