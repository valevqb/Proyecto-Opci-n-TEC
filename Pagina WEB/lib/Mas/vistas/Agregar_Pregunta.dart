import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:opciontec/Mas/vistas/mas_inicio.dart';

import '../../locators.dart';
import '../controladores/datos_Preguntas.dart';
//import 'Calendario.dart';

class AgregarPregunta extends StatefulWidget {
  @override
  _AgregarPreguntaState createState() => _AgregarPreguntaState();
}

class _AgregarPreguntaState extends State<AgregarPregunta> {
  var IMG;
  var categoria;
  var enlaces = [];
  var pregunta;
  var respuesta;
  var width = 0.0;
  GlobalKey llave = GlobalKey<FormState>();
  List<Map> temas = [
    {"nombre": "Admisión", "revisado": false},
    {"nombre": "Matrícula", "revisado": false}
  ];

  @override
  void initState() {
    width = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;

    return MaterialApp(
        title: "Agregar Pregunta",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_circle_left_rounded,
                    size: 40.0, color: Color(0xBE5CC6DE)),
              ),
              centerTitle: true,
              title: const Text('Agregar Pregunta',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: (isLoading)
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("* Información Obligatoria",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B436D))),
                        textTittle(context, "* Pregunta"),
                        textInfo(context, "Escriba la pregunta"),
                        textForms(context, "¿Qué, cómo, dónde...?", 0),
                        textTittle(context, "* Tema"),
                        textInfo(context, "Seleccione el grupo en el que puede agrupar este tema"),
                        infoTema(),
                        textTittle(context, "* Respuesta"),
                        textInfo(context, "Escriba la respuesta de la pregunta"),
                        textForms(context, "/R", 1),
                        textTittle(context, "Enlaces"),
                        textInfo(context, "Escriba los para información extra, sepárelos por ;"),
                        textForms(context, "Ej. Enlace1; Enlace2; Enlace3", 2),
                        textTittle(context, "Imagen"),
                        textInfo(context, "Coloque el enlace de una imagen"),
                        textForms(context, "Enlace", 3),
                        AgregarPreguntaBotton(context),
                      ],
                    ),
                  ),
                ))));
  }

  Widget infoTema() {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: temas.map((sedeSeleccion){
            return CheckboxListTile(
                value: sedeSeleccion["revisado"],
                title: Text(sedeSeleccion["nombre"]),
                onChanged: (newValue){
                  setState(() {
                    sedeSeleccion["revisado"] = newValue;
                  });
                });
          }).toList(),
        ));
  }

  Widget textTittle(BuildContext context, titulo) {
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B436D))));
  }

  Widget textTittle2(BuildContext context, titulo) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B436D))));
  }

  Widget textInfo(BuildContext context, titulo) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))));
  }

  Widget textForms(BuildContext context, palabras, tipo) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F2F5),
              hintText: palabras.toString(),
              hintStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: const EdgeInsets.all(8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFF0F2F5)),
                borderRadius: BorderRadius.circular(5.0),
              )),
          onChanged: (value) {
            if (tipo == 0) {
              pregunta = value.toString();
            } else if (tipo == 1) {
              respuesta = value.toString();
            } else if (tipo == 2) {
              enlaces = value.toString().split("; ");
            } else if (tipo == 3) {
              IMG = value.toString();
            }
          },
        ));
  }

  Widget letter(BuildContext context, palabras) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))));
  }

  Widget AgregarPreguntaBotton(BuildContext context) {
    return SizedBox(
      width: width - 24,
      child: Card(
        color: const Color(0xFFCBEFF7),
        elevation: 5,
        margin: const EdgeInsets.only(top: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {
            if (pregunta.toString() == "null" || respuesta.toString() == "null" || temas.toString() == "null") {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return validaciones(context, "Error",
                      "Todas las casillas deben tener contenido");
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return aceptacion(context);
                },
              );
            }
            //codigo al presionarse
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text(
              "Agregar Pregunta",
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)),
            ),
          ),
        ),
      ),
    );
  }

  Widget validaciones(BuildContext context, titulo, message) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(titulo.toString(),
              style: const TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)))),
      content: Text(message.toString(),
          style: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C2D4B))),
      actions: <Widget>[
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  Widget aceptacion(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: const Text('Confirmar datos'),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        letter(context, "* Confirme que los datos sean correctos *"),
        letter(context, "Pregunta: $pregunta"),
        letter(context, "Tema: $temas"),
        letter(context, "Respuesta: $respuesta"),
        const SizedBox(height: 30),
        Row(
          children: [
            TextButton(
                child: const Text("Aceptar"),
                onPressed: () {
                  /*locator<DatosPreguntas>().postPregunta(
                      nombre,
                      fechaInicial.text.toString(),
                      fechaFinal.text.toString(),
                      detalles,
                      "TRUE");*/

                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return validaciones(
                          context, "Agregado", "Pregunta Agregado con éxito");
                    },
                  );

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        InicioMas(),
                  ));
                }),
            TextButton(
                child: const Text("Modificar"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ]),
    );
  }
}
