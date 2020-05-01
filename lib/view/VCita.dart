import 'package:los_7_pasos/model/MCita.dart';
import 'package:flutter/material.dart';
import '../control/CtipoCita.dart';
import 'package:los_7_pasos/utils/TextStyles.dart';
import 'package:los_7_pasos/utils/consts.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute({Key key, @required this.citaUnica}) : super(key: key);
  final Cita citaUnica;

  Widget _getTipo() {
    return Text(
      'Tipo de Cita: ${CTipoCita.tipoCita}',
      style: TextStyle(fontSize: 20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de la Cita"),
        backgroundColor: Colors.purpleAccent,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Text(
              'Hora: ${citaUnica.fecha_cita.replaceAll('T00:00:00', '')}\n',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Fecha: ${citaUnica.hora_cita.replaceRange(5, 8, '')}',
              style: TextStyle(fontSize: 20.0),
            ),
            _getTipo(),
          ]),
        ),
      ),
    );
  }

}
