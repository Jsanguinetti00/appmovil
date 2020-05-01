import 'package:flutter/material.dart';

class VConferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
    return
    Scaffold(
       appBar: AppBar(
          title: Text("Conferencia"),
          backgroundColor: Colors.purpleAccent,
          
        ),
      body: Center(
      child: Icon(Icons.event,size: 50,)));
     
  }
}