import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:opciontec/Sesion/vistas/Registrarme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../locators.dart';

class AgregarEvento extends StatefulWidget {
  @override
  _AgregarEventoState createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento> {
  var nombre;
  var detalles;
  var enlace;
  TextEditingController fechaInicial = TextEditingController(); //se obtiene con fechaInicial.text.toString()
  TextEditingController fechaFinal = TextEditingController(); //se obtiene con fechaFinal.text.toString()
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
              centerTitle: true,
              title: const Text('Agregar evento',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.account_circle_sharp,
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
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
                      textInfo(context, "Utilice solo uno de los formatos"),
                      const SizedBox(height: 10),
                      textTittle2(context, "Primer formato"),
                      textInfo(context, "Fecha única"),
                      fechas(context, 0, fechaInicial),
                      const SizedBox(height: 10),
                      textTittle2(context, "Segundo formato"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            textInfo(context, "Fecha inicio"),
                            fechas(context, 0, fechaInicial),
                            ]
                          ),
                          SizedBox(width: 25),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                textInfo(context, "Fecha Fin"),
                                fechas(context, 1, fechaFinal),
                              ]
                          )
                        ]
                      ),
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
              )
            )));
  }

  Widget fechas(BuildContext context, tipo, controlador){
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        width: (width/2) - 25,
        child: TextField(
          controller: controlador,  //editing controller of this TextField
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F2F5),
              hintText: "Seleccione una fecha",
              hintStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: const EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
          ),
          readOnly: true,
          onTap: () async {
            DateTime? fechaTomada = await showDatePicker(
                context: context, initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100)
            );

            if(fechaTomada != null ){
              String formattedDate = DateFormat('yyyy-MM-dd').format(fechaTomada);

              setState(() {
                if(tipo == 0){
                  fechaInicial.text = formattedDate;
                }
                else{
                  fechaFinal.text = formattedDate;
                }
              });
            }else{
              print("Date is not selected");
            }
          },
        ),
    );
  }

  Widget textTittle(BuildContext context, titulo){
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Text(titulo,
        style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B436D))
      )
    );
  }

  Widget textTittle2(BuildContext context, titulo){
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B436D))
        )
    );
  }

  Widget textInfo(BuildContext context, titulo){
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))
        )
    );
  }

  Widget textForms(BuildContext context, palabras, tipo){
    print(fechaFinal.text.toString());
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
        child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF0F2F5),
            hintText: palabras.toString(),
            hintStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
        onSaved: (value){
          if(tipo == 0){
            nombre = value.toString();
          }
          else if (tipo == 1){
            detalles = value.toString();
          }
          else if(tipo == 2){
            enlace = value.toString();
          }
        },
        validator: (value){
          if(value.toString().isEmpty){
            return "Llenar este campo";
          }
        },
      )
    );
  }

  Widget letter(BuildContext context, palabras){
    return Container(
        margin: const EdgeInsets.only(top: 32.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D)))
    );
  }

  Widget AgregarEventoBotton(BuildContext context){
    return SizedBox(
      width: width-24,
      child: Card(
        color: const Color(0xFFCBEFF7),
        elevation: 5,
        margin: const EdgeInsets.only(top: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {
            if(nombre.toString().isEmpty || fechaInicial.text.isEmpty || detalles.toString().isEmpty){
              print("No hay nada de nada");
              showDialog(
                  context: context,
                builder: (BuildContext context) {
                    return validaciones(context);
                },
              );
            }
            //codigo al presionarse
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text( "Agregar evento",
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

  Widget validaciones(BuildContext context) {
    print("entra");
    return AlertDialog(
      title: Text('Error'),
      content:
      Text("Todas las casillas deben tener contenido"),
      actions: <Widget>[
        TextButton(
            child: Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

}

