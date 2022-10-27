import 'package:flutter/material.dart';
import 'package:opciontec/Mas/modelos/Preguntas.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:opciontec/Mas/vistas/Costos_y_Becas.dart';
import 'package:opciontec/Mas/vistas/Info_Preguntas.dart';
import 'package:provider/provider.dart';
import 'package:opciontec/Mas/vistas/Agregar_Pregunta.dart';

import '../../Calendario/vistas/Calendario.dart';
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
        //theme: ThemeData(scaffoldBackgroundColor:Color(0xFFCBEFF7) ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Más Información',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2D4B))),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: (isLoading)
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Secciones(
                        texto: 'Te pueden interesar',
                        tamano: 24.0,
                        color: const Color(0xFF1C2D4B)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(
                            height: 120,
                            width: (width - 40) / 2,
                            child: FloatingActionButton.extended(
                              heroTag: UniqueKey(),
                              label: const Text('Costos y becas',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C2D4B))),
                              // <-- Text
                              backgroundColor: const Color(0xFFF3E8CB),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              icon: const Icon(
                                  // <-- Icon
                                  Icons.monetization_on_outlined,
                                  size: 24.0,
                                  color: Color(0xFFF1AE03)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Costos_y_Becas(),
                                ));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            width: (width - 40) / 2,
                            child: FloatingActionButton.extended(
                              label: const Text('Calendario',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C2D4B))),
                              // <-- Text
                              backgroundColor: Colors.indigo.shade50,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              icon: const Icon(
                                  // <-- Icon
                                  Icons.calendar_month_rounded,
                                  size: 24.0,
                                  color: Color(0xBE3154E5)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CalendarApp(),
                                ));
                              },
                            ),
                          ),
                        ]),
                    Secciones(
                        texto: 'Preguntas frecuentes',
                        tamano: 24.0,
                        color: const Color(0xFF1C2D4B)),
                    Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(right: 24),
                      child: SizedBox(
                        height: 50,
                        width: (width - 40) / 4,
                        child: FloatingActionButton.extended(
                          label: const Text('Agregar Pregunta',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1C2D4B))),
                          // <-- Text
                          backgroundColor: Colors.lightBlue.shade100,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0))),
                          icon: const Icon(
                            // <-- Icon
                              Icons.add_rounded,
                              size: 24.0,
                              color: Color(0xBE5CC6DE)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AgregarPregunta(),
                            ));
                          },
                        ),
                      ),
                    ),
                    Secciones(
                        texto: 'Admisión',
                        tamano: 14.0,
                        color: const Color(0xFF1C2D4B)),
                    SizedBox(
                      height: 230,
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: Preguntas![1].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      Preguntas[1][index].Pregunta!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF1C2D4B)),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_circle_right_rounded,
                                        color: Color(0xBE5CC6DE),
                                      ),
                                      //tooltip: 'Increase volume by 10',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Info_Pregunta(
                                              Preguntas![1][index]),
                                        ));
                                      },
                                    ),
                                  ),
                                );
                              })),
                    ),
                    Secciones(
                        texto: 'Matricula',
                        tamano: 14.0,
                        color: const Color(0xFF1C2D4B)),
                    SizedBox(
                      height: height / 4,
                      child: Container(
                          decoration: const BoxDecoration(
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
                                      Preguntas[0][index].Pregunta!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1C2D4B)),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_circle_right_rounded,
                                        color: Color(0xBE5CC6DE),
                                      ),
                                      //tooltip: 'Increase volume by 10',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Info_Pregunta(
                                              Preguntas![0][index]),
                                        ));
                                      },
                                    ),
                                  ),
                                );
                              })),
                    ),
                  ],
                )),
        ));
  }
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  Color color = Colors.lightBlue;

  Secciones({
    required this.texto,
    required this.tamano,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(texto,
          style: TextStyle(
              fontSize: tamano, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
