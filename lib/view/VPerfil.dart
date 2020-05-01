import 'package:los_7_pasos/model/MPersona.dart';
import '../model/StaticPersona.dart';
import 'package:los_7_pasos/view/VCitas.dart';
import 'package:los_7_pasos/view/VConferencia.dart';
import 'package:los_7_pasos/view/VMediciones.dart';
import 'package:los_7_pasos/view/VPersona.dart';
import 'package:los_7_pasos/view/VFoto.dart';
import 'package:los_7_pasos/view/VPerfil.dart';
import 'package:flutter/material.dart';

class VPerfil extends StatefulWidget {
  VPerfil({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VPerfilState createState() => _VPerfilState();
}

class _VPerfilState extends State<VPerfil> {
  final String url =
      'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/04/15/lionel-messi-0.jpg?';
  final Color green = Color(0xFF1E8161);
  final VPersona _personas = new VPersona();
  final VPerfil _perfil = new VPerfil();
  final VMediciones _mediciones = new VMediciones();
  final VConferencias _conferencias = new VConferencias();
  final VCitas _cita = new VCitas();
  final VFoto _foto = new VFoto();
  Widget _pantalla(int page) {
    Widget pantalla;
    switch (page) {
      case 0:
         pantalla = _conferencias;
        break;
      case 1:
         pantalla = _mediciones;
        break;
      case 2:
         pantalla = _personas;
        break;
      case 3:
         pantalla = _cita;
        break;
      default:
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pantalla,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 ,
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Edad',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${SPersona.edad}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(url))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16,top:20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            ' Años\n  con \nDiabetes',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${SPersona.anioscondiabetes}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "ID: ${SPersona.idPersona}",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    '${SPersona.nombre} ${SPersona.apellidoPater} ${SPersona.apellidoMater}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          onPressed: () {_pantalla(3);},
                        ),
                        Text(
                          'Citas',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.show_chart,
                            color: Colors.grey,
                          ),
                          onPressed: () {_pantalla(1);},
                        ),
                        Text(
                          'Nivel Azucar',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.card_giftcard,
                            color: Colors.grey,
                          ),
                          onPressed: () {_pantalla(0);},
                        ),
                        Text(
                          'Sugerencias',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.web,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        Text('Sitio web')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.blur_circular,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        Text('Daily bonus')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        Text('Visitors')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
