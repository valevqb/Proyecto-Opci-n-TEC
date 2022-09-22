import 'package:flutter/material.dart';
import 'package:untitled/Mas/modelos/Preguntas.dart';
import 'package:untitled/Mas/controladores/datos_preguntas.dart';
import 'package:untitled/Mas/vistas/Costos_y_Becas.dart';
import 'package:untitled/Mas/vistas/Info_Preguntas.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioMas extends StatefulWidget {
  @override
  _InicioMasState createState() => _InicioMasState();
}

class _InicioMasState extends State<InicioMas> {
  @override
  void initState() {
    super.initState();
    locator<DatosPreguntas>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<List<DataPreguntas>>? Preguntas =
        Provider.of<DatosPreguntas>(context).preguntas;
    bool isLoading = Provider.of<DatosPreguntas>(context).isLoading;
    return MaterialApp(
        title: "Pez Prueba",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Más Información',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900)),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_sharp, size: 40.0, color: Colors.lightBlue),
              ),
            ],
          ),
          body: (isLoading)
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                    Secciones(texto: 'Te pueden interesar', tamano: 24.0),
                    Row(
                        children: <Widget>[
                          SizedBox(
                            height: 120,
                            width: (width - 40) / 2,
                            child: FloatingActionButton.extended(
                              heroTag: UniqueKey(),
                              label: Text('Costos y becas',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900)),
                              // <-- Text
                              backgroundColor: Colors.amber.shade100,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              icon: Icon(
                                // <-- Icon
                                Icons.monetization_on_outlined,
                                size: 24.0,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Costos_y_Becas(),
                                ));
                              },
                            ),
                            /*Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new IconButton(
                                    icon: const Icon(
                                        Icons.monetization_on_outlined,
                                        size: 18.0,
                                        color: Colors.blueGrey),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Costos_y_Becas(),
                                      ));
                                    },
                                  ),
                                  Text('Costos y becas',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade900)),
                                ],
                              )*/
                          ),
                          SizedBox(
                            height: 120,
                            width: (width - 40) / 2,
                            child: FloatingActionButton.extended(
                              label: Text('Calendario',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900)),
                              // <-- Text
                              backgroundColor: Colors.indigo.shade50,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              icon: Icon(
                                // <-- Icon
                                Icons.calendar_month_rounded,
                                size: 24.0,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max),
                    Secciones(texto: 'Preguntas frecuentes', tamano: 24.0),
                    Secciones(texto: 'Admisión', tamano: 14.0),
                    SizedBox(
                      height: 230,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: Preguntas![1].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      Preguntas[1][index].Pregunta!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_circle_right_rounded,
                                        color: Colors.lightBlue,
                                      ),
                                      //tooltip: 'Increase volume by 10',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Info_Pregunta(Preguntas![1][index]),
                                        ));
                                      },
                                    ),
                                  ),
                                );
                              })),
                    ),
                    Secciones(texto: 'Matricula', tamano: 14.0),
                    SizedBox(
                      height: height/4,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: Preguntas![0].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      Preguntas[1][index].Pregunta!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_circle_right_rounded,
                                        color: Colors.lightBlue,
                                      ),
                                      //tooltip: 'Increase volume by 10',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Info_Pregunta(Preguntas![0][index]),
                                        ));
                                      },
                                    ),
                                  ),
                                );
                              })),
                    ),
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
