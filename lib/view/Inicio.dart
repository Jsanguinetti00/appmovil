import 'package:los_7_pasos/model/MPersona.dart';
import '../model/StaticPersona.dart';
import 'package:los_7_pasos/view/VCitas.dart';
import 'package:los_7_pasos/view/VConferencia.dart';
import 'package:los_7_pasos/view/VMediciones.dart';
import 'package:los_7_pasos/view/VPersona.dart';
import 'package:los_7_pasos/view/VFoto.dart';
import 'package:los_7_pasos/view/VPerfil.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Inicio extends StatefulWidget {
  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<Inicio> {
  Persona personaUnica;
  void initState() {
    super.initState();
    print(SPersona.nombre.toString());
  }

  int _pageIndex = 2;

  final VPersona _personas = new VPersona();
  final VPerfil _perfil=new VPerfil();
  final VMediciones _mediciones = new VMediciones();
  final VConferencias _conferencias = new VConferencias();
  final VCitas _cita = new VCitas();
  final VFoto _foto =new VFoto();
  Widget _showPage = new VPersona();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _perfil;
        break;
      case 1:
        return _mediciones;
        break;
      case 2:
        return _personas;
        break;
      case 3:
        return _cita;
        break;
      default:
        return new Container(
            child: new Center(
          child: new Text('Que Hisiste:\n1.-Nada\n2.-No sé\n3.-No Fui Yo',
              style: new TextStyle(fontSize: 30)),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bienvenido ${SPersona.nombre}"),
          backgroundColor: Colors.purpleAccent,
          
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.supervised_user_circle, size: 30),
            Icon(Icons.content_paste, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.calendar_today, size: 30),
            
          ],
          color: Colors.purpleAccent,
          buttonBackgroundColor: Colors.purpleAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeOutBack,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
