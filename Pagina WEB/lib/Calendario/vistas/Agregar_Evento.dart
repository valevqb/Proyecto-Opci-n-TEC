import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:opciontec/Estilos/Estilos.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../locators.dart';
import '../controladores/datos_eventos.dart';
import 'Calendario.dart';

class AgregarEvento extends StatefulWidget {
  @override
  _AgregarEventoState createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento> {
  var nombre;
  var detalles;
  var enlace;
  TextEditingController fechaInicial =
      TextEditingController(); //se obtiene con fechaInicial.text.toString()
  TextEditingController fechaFinal =
      TextEditingController(); //se obtiene con fechaFinal.text.toString()
  var width = 0.0;
  GlobalKey llave = GlobalKey<FormState>();

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
        title: "Agregar Evento",
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
              title: const Text('Agregar evento',
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
                          textTittle(context, "* Fecha"),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      textInfo(context, "Fecha inicio"),
                                      fechas(context, 0, fechaInicial),
                                    ]),
                                const SizedBox(width: 25),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      textInfo(context, "Fecha Fin"),
                                      fechas(context, 1, fechaFinal),
                                    ])
                              ]),
                          textTittle(context, "* Nombre"),
                          textInfo(context, "Escriba el nombre del evento"),
                          textForms(context, "Nombre del evento", 0),
                          textTittle(context, "* Detalle"),
                          textInfo(context, "Escriba los detalles del evento"),
                          textForms(context, "Detalles del evento", 1),
                          textTittle(context, "Enlace"),
                          textInfo(context, "Escriba el enlace del evento"),
                          textForms(context, "Enlace del evento", 2),
                          AgregarEventoBotton(context),
                        ],
                      ),
                    ),
                  ))));
  }

  Widget fechas(BuildContext context, tipo, controlador) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: (width / 2) - 25,
      child: TextField(
        controller: controlador, //editing controller of this TextField
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF0F2F5),
          hintText: "Seleccione una fecha",
          hintStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.5)),
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF0F2F5)),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? fechaTomada = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100));

          if (fechaTomada != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(fechaTomada);

            setState(() {
              if (tipo == 0) {
                fechaInicial.text = formattedDate;
              } else {
                fechaFinal.text = formattedDate;
              }
            });
          } else {
            //print("Date is not selected");
          }
        },
      ),
    );
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
              nombre = value.toString();
            } else if (tipo == 1) {
              detalles = value.toString();
            } else if (tipo == 2) {
              enlace = value.toString();
            }
          },
          validator: (value) {
            if (value.toString().isEmpty) {
              return "Llenar este campo";
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

  Widget AgregarEventoBotton(BuildContext context) {
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
            if (nombre.toString() == "null" ||
                fechaInicial.toString().isEmpty ||
                detalles.toString() == "null") {
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
              "Agregar evento",
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
        letter(context, "Fecha inicial: " + fechaInicial.text.toString()),
        letter(
            context,
            "Fecha final (si es diferente a la inicial): " +
                fechaFinal.text.toString()),
        letter(context, "Nombre: " + nombre.toString()),
        letter(context, "Detalles: " + detalles.toString()),
        letter(context, "Enlaces extras: " + enlace.toString()),
        const SizedBox(height: 30),
        Row(
          children: [
            TextButton(
                child: const Text("Aceptar"),
                onPressed: () {
                  locator<DatosEventos>().postEvento(
                      nombre,
                      fechaInicial.text.toString(),
                      fechaFinal.text.toString(),
                      detalles,
                      "TRUE");

                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return validaciones(
                          context, "Agregado", "Evento Agregado con éxito");
                    },
                  );

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CalendarApp(),
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
