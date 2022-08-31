import 'package:flutter/material.dart';
import 'Pez1_Screen.dart';
import 'Carreras/vistas/carrera_inicio.dart';
import 'Servicios/vistas/servicio_inicio.dart';

class PrototipoBarra extends StatefulWidget {
  State<StatefulWidget> createState() => _PrototipoBarra();
}


class _PrototipoBarra extends State<PrototipoBarra> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Plantilla(),
    Plantilla2(),
    InicioCarrera(),
    InicioServicio(),
    PezPading(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pez Prueba",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        /*
        appBar: AppBar(
          title: Text("Pez pantalla 2"),
        ),*/
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          selectedItemColor: Colors.cyan,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Inicio"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: "Admision"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), label: "Carreras"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.synagogue), label: "Campus"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze_rounded), label: "Mas"
            ),
          ],
        ),
      ), //),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
