import 'package:flutter/material.dart';
import 'package:opciontec/Mas/modelos/Preguntas.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:opciontec/Mas/vistas/Costos_y_Becas.dart';
import 'package:opciontec/Mas/vistas/Info_Preguntas.dart';
import 'package:provider/provider.dart';

import '../../Config.dart';
import '../../Sesion/vistas/Login.dart';
import '../../Sesion/vistas/Ver_Sesion.dart';
import '../../locators.dart';
import 'Calendario.dart';

class InicioMas extends StatefulWidget {
  const InicioMas({Key? key}) : super(key: key);

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
            actions: [
              IconButton(
                onPressed: () {
                  if (Config.Sesion.contrasena.toString() == "null") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerLaSesion()),
                    );
                  }
                },
                icon: const Icon(Icons.account_circle_sharp,
                    size: 40.0, color: const Color(0xBE5CC6DE)),
              ),
            ],
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0))),
                              icon: const Icon(
                                  // <-- Icon
                                  Icons.monetization_on_outlined,
                                  size: 24.0,
                                  color: Color(0xFFF1AE03)),
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
                    Secciones(
                        texto: 'Admisión',
                        tamano: 14.0,
                        color: const Color(0xFF1C2D4B)),
                    SizedBox(
                      height: 230,
                      child: Container(
                          decoration: const BoxDecoration(
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
    Key? key,
    required this.texto,
    required this.tamano,
    required this.color,
  }) : super(key: key);

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
