import 'package:flutter/material.dart';
import 'Pez1_Screen.dart';
import 'Mas/vistas/mas_inicio.dart';
import 'Carreras/vistas/carrera_inicio.dart';
import 'Inicio/vistas/inicio_start.dart';
import 'Servicios/vistas/servicio_inicio.dart';
import 'Admision/vistas/Admision_inicio.dart';
import 'Sesion/vistas/Login.dart';
import 'Estilos/Estilos.dart';

class PrototipoBarra extends StatefulWidget {
  State<StatefulWidget> createState() => _PrototipoBarra();
}


class _PrototipoBarra extends State<PrototipoBarra> {
  int _currentIndex = 0;
  final controller = TextEditingController();
  var textoFinal = "Carrera, becas, servicios, etc.";
  final List<Widget> _children = [
    //Plantilla(),
    //Plantilla2(),
    Inicio(),
    InicioAdmision(),
    InicioCarrera(),
    InicioServicio(),
    InicioMas(),
    PezPading(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pez Prueba",
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: pantallaPrincipal, //titulo mas grande
          titleMedium: titulosTipos, //tipos de carreras, etc
          titleSmall: tituloContenedor, //el titulo principal de las cartas
          bodyLarge: titulosCuerpo, //subtitulos de carreras, servicios, ect
          bodySmall: descripciones
        )
      ),
      //ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('OpciónTEC',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B))
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              child: Text("Inicio",
                  style: TextStyle(
                      fontSize: 1.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              onPressed: () => {
                setState(() {
                  _currentIndex = 0;
                }),
              },
            ),
            TextButton(
              child: Text("Admisión",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              onPressed: () => {
                setState(() {
                  _currentIndex = 1;
                }),
              },
            ),
            TextButton(
              child: Text("Carreras",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              onPressed: () => {
                setState(() {
                  _currentIndex = 2;
                }),
              },
            ),
            TextButton(
              child: Text("Servicios",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              onPressed: () => {
                setState(() {
                  _currentIndex = 3;
                }),
              },
            ),
            TextButton(
              child: Text("Más",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              onPressed: () => {
                setState(() {
                _currentIndex = 4;
                }),
              },
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogIn()),
                  );
                },
                icon: Icon(Icons.account_circle_sharp,
                    size: 40.0, color: Color(0xFF1C2D4B)),
              ),
            )
          ],
        ),
        body: _children[_currentIndex],
      ), //),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
