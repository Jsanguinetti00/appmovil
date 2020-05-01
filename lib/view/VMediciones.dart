import '../services/repositorio.dart';
import 'package:flutter/material.dart';
import '../model/MMedicionDiaria.dart';
import '../model/StaticPersona.dart';
import 'dart:io';

class VMediciones extends StatefulWidget {
  @override
  _Registrostate createState() => _Registrostate();
}

class _Registrostate extends State<VMediciones> {
  
  final _medicion = TextEditingController();
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    _medicion.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    
  }

  

  callAPI() {
    Medicion medicion = Medicion(
      primeraMedicion: 1,
      resul_medi: double.parse( _medicion.text),
      fecha_medi: DateTime.now(),
      hora_medi:  DateTime.now().hour,
      idTipomedi: 1,
      idpersona: SPersona.idPersona,
    );
    medicion1(medicion).then((response) {
      if (response.statusCode > 200) {
        print(response.body + '\n');

        
      } else
        print(response.statusCode);
    }).catchError((error) {
      print('error');
    });
  }

  Widget nombreInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Resultado de medicion'),
          controller: _medicion,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          
    ));
  }

  

  

  Future<void> _cuadroDialogo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Hay Campos Vacios'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _cuadroDialogoCorre() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Listo'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  validarVacio() {
    if (_medicion.text.isEmpty) {
      _cuadroDialogo();
    } else {
      callAPI();
    }
  }

  Widget registrarButtom(context) {
    return Container(
        padding: const EdgeInsets.only(top: 40),
        child: RaisedButton(
          child: Text('Registrar'),
          shape: StadiumBorder(),
          textColor: Colors.white,
          color: Colors.purpleAccent,
          onPressed: () {
            callAPI();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Mediciones"),
          backgroundColor: Colors.purpleAccent,
          
        ),
      
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            nombreInput(),
            registrarButtom(context)
          ],
        ),
      ),
    );
  }
  

}
