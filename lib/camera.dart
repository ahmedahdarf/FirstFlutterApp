import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File imageFile;
  _openGallery(BuildContext context) async{
        var picture=await  ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
          imageFile=picture;
        });
        Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async{
    var picture=await  ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }
  Future<void> _showChoiseDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
         return AlertDialog(
           title: Text("Make a choise !"),
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 GestureDetector(
                   child: Text("Gallery"),
                   onTap: (){
                     _openGallery(context);
                   },
                 ),
                 Padding(padding: EdgeInsets.all(6.0 ),),
                 GestureDetector(
                   child: Text("Camera"),
                   onTap: (){
                     _openCamera(context);
                   },
                 )
               ],
             ),
           ),
         );
    });
  }
  Widget _decideImageView(){
    if(imageFile==null) return Text("No selected image");
    else{
      return Image.file(imageFile,width: 400,height: 400,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent,title: Text("Camera"),),
      body:Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              Center(
                child: RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: (){
                      _showChoiseDialog(context);
                  },
                  child: Text("Select image" ,style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


