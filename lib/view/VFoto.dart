import 'dart:async';
import 'dart:io';
import '../model/StaticPersona.dart';

import 'package:flutter/material.dart';

//Image Plugin
import 'package:image_picker/image_picker.dart';

//Firebase Storage Plugin
import 'package:firebase_storage/firebase_storage.dart';



class VFoto extends StatefulWidget {
  @override
  _VFotoState createState() => new _VFotoState();
}

class _VFotoState extends State<VFoto> {
  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new Center(
        child: sampleImage == null ? Text('Select an image') : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor:  Colors.purpleAccent,
        onPressed: getImage,
        tooltip: 'Add Image', 
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          RaisedButton(
            elevation: 7.0,
            child: Text('Subir'),
            textColor: Colors.white,
            color: Colors.purpleAccent,
            onPressed: () {
              final StorageReference firebaseStorageRef =
                  FirebaseStorage.instance.ref().child('images/${SPersona.idPersona}.jpg');
              final StorageUploadTask task =
                  firebaseStorageRef.putFile(sampleImage);
              
            },
          )
        ],
      ),
    );
  }
}
