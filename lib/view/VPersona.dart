import 'package:flutter/material.dart';

import '../model/StaticPersona.dart';

class VPersona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: new Text('Nombre: ${SPersona.nombre}\n'+'Apellido: ${SPersona.apellidoPater}' +
                      ' ' +
                      '${SPersona.apellidoMater}\n'+'Edad: ${SPersona.edad}\n'+'Años con diabetes: ${SPersona.anioscondiabetes}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'sans-serif-light',
                      color: Colors.black)),
            ),
            
            
            
          ]),
    );
  }
}
