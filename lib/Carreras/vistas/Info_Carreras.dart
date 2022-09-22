import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Carreras/modelos/Carrera.dart';
import 'package:untitled/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioCarrera extends StatefulWidget {
  @override
  _InicioCarreraState createState() => _InicioCarreraState();
}

class _InicioCarreraState extends State<InicioCarrera> {
  @override
  void initState() {
    super.initState();
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DataCarrera>? users = Provider.of<DatosCarrera>(context).carreras;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    return MaterialApp(
        title: "Pez carreras",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Infor carreras',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900)),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {Navigator.of(context).pop();},
              icon: const Icon(Icons.arrow_circle_left_rounded, size: 40.0, color: Colors.lightBlue),
            ),
          ),
          body: (isLoading)
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Secciones(texto: ' ', tamano: 14.0),

                  Secciones(texto: 'Nombre Carrera', tamano: 24.0),
                  Secciones(texto: 'Descripcion', tamano: 18.0),
                  Secciones(texto: 'Acreditacion', tamano: 18.0),
                  Secciones(texto: 'Perfil del estudiante', tamano: 20.0),
                  Secciones(texto: 'Intereses', tamano: 14.0),
                  Secciones(texto: 'Habilidades', tamano: 14.0),
                  Secciones(texto: 'Area Laboral', tamano: 20.0),
                  Secciones(texto: 'Plan de Estudio', tamano: 20.0),

                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )),
        ));
  }
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;

  Secciones({
    required this.texto,
    required this.tamano,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          style: TextStyle(
              fontSize: this.tamano,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900)),
    );
  }
}
