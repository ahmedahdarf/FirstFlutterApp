import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './gallery-data-page.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  String keyWords="";
  TextEditingController editingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent,title: Text(keyWords),),
      body: Column(

        children: <Widget>[
              Container(
                child: TextField(
                    style: TextStyle(fontSize: 20),
                  onChanged: (value){
                      setState(() {
                        this.keyWords=value;
                      });
                  },
                  onSubmitted: (value){
                      this.keyWords=value;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryDataPage(this.keyWords)));
                    editingController.text="";
                  },
                  controller: editingController,
                  decoration: InputDecoration(hintText: "Taper la place que vous voulez!"),
                ),

                padding: EdgeInsets.all(9),
              ),
              Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text("Get Images ", style: TextStyle(fontSize: 18,color: Colors.white),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryDataPage(keyWords)));
                      editingController.text="";
                    },
                    padding: EdgeInsets.all(9),
                    color: Colors.deepOrange,
                  )
              )
        ],
      ),
    );
  }
}


