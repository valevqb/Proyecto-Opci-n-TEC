//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Mas/modelos/Preguntas.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:provider/provider.dart';
import 'package:opciontec/Mas/vistas/mas_inicio.dart';
import '../../locators.dart';

class ModificarPregunta extends StatefulWidget {
  final DataPreguntas PreguntaSeleccionado;
  ModificarPregunta(this.PreguntaSeleccionado);

  @override
  _ModificarPreguntaState createState() => _ModificarPreguntaState();
}

class _ModificarPreguntaState extends State<ModificarPregunta> {
  late DataPreguntas _valor;
  var bandera = 0;
  TextEditingController IMG = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController enlaces1 = TextEditingController();
  TextEditingController pregunta = TextEditingController();
  TextEditingController respuesta = TextEditingController();
  var enlaces = [];
  var width = 0.0;
  GlobalKey llave = GlobalKey<FormState>();
  List<Map> categorias = [
    {"nombre": "Admision", "revisado": false},
    {"nombre": "Matricula", "revisado": false}
  ];

  @override
  void initState() {
    width = 0.0;
    _valor = widget.PreguntaSeleccionado;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    bool isLoading = Provider.of<DatosPreguntas>(context).isLoading;

    if (bandera == 0) {
      print(_valor.Categoria.toString());
      IMG.text = _valor.IMG!;
      categoria.text = _valor.Categoria!;
      pregunta.text = _valor.Pregunta!;
      respuesta.text = _valor.Respuesta!;
      enlaces = _valor.Enlaces!;

      enlaces1.text = _valor.Enlaces!.join("; ");
      selectedFiles(context, categorias, categoria);
    }

    bandera = 1;

    return MaterialApp(
        title: "Modificar Pregunta",
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
              title: const Text('Modificar Pregunta',
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
                        InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return verificarEliminar(context);
                                },
                              );
                            },
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: const Text('Eliminar Pregunta',
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                        color: Colors.red)))),
                        const Text("* Información Obligatoria",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B436D))),
                        textTittle(context, "* Pregunta"),
                        textInfo(context, "Escriba la pregunta"),
                        textForms(context, pregunta.text.toString(), 0),
                        textTittle(context, "* Tema"),
                        textInfo(context, "Seleccione el grupo en el que puede agrupar este tema"),
                        infoTema(),
                        textTittle(context, "* Respuesta"),
                        textInfo(context, "Escriba la respuesta de la pregunta"),
                        textForms(context, respuesta.text.toString(), 1),
                        textTittle(context, "Enlace"),
                        textInfo(context, "Pegue el enlace de la información"),
                        textForms(context, enlaces1.text.toString(), 2),
                        textTittle(context, "Imagen"),
                        textInfo(context, "Coloque el enlace de una imagen"),
                        textForms(context, IMG.text.toString(), 3),
                        ModificarPreguntaBotton(context),
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
          children: categorias.map((sedeSeleccion){
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

  void selectedFiles(BuildContext context, datas, data){
    datas.map((marked){
      var nameData = data.text.toString().split(", ");
      var dataFinal = nameData[nameData.length-1].toString().split(" y ");
      nameData = nameData + dataFinal;
      if (nameData.contains(marked["nombre"].toString())){
        marked["revisado"] = true;
      }
    }).toList();
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
              hintText: palabras.toString(),
              filled: true,
              fillColor: const Color(0xFFF0F2F5),
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
              pregunta.text = value.toString();
            } else if (tipo == 1) {
              respuesta.text = value.toString();
            } else if (tipo == 2) {
              //enlaces = value.toString();
            } else if (tipo == 3) {
              IMG.text = value.toString();
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

  Widget ModificarPreguntaBotton(BuildContext context) {
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
            try{
              enlaces = enlaces1.text.toString().split("; ");

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return aceptacion(context);
                },
              );
            } catch (_) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return validaciones(context, "Error",
                      "Todas las casillas deben tener contenido");
                },
              );
            }
            //codigo al presionarse
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text(
              "Modificar Pregunta",
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
        child: textTittle(context, 'Confirmar datos'),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        letter(context, "* Los datos escritos son correctos? *"),
        letter(context, "Si desea revisarlos, presione modificar"),
        const SizedBox(height: 30),
        Row(
          children: [
            TextButton(
                child: const Text("Aceptar"),
                onPressed: () {
                  //aqui se mandan los datos
                  locator<DatosPreguntas>().ModificarPregunta(
                      _valor.id,
                      pregunta.text,
                      respuesta.text,
                      IMG.text,
                      enlaces,
                      categoria.text);

                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return validaciones(
                          context, "Agregado", "Evento Agregado con éxito");
                    },
                  );

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InicioMas(),
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

  Widget verificarEliminar(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: const Text('Eliminar pregunta')),
      content: Text("Seguro que deseas eliminar la pregunta: ${pregunta.text}"),
      actions: <Widget>[
        TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              locator<DatosPreguntas>().EliminarPregunta(_valor.id);
              Navigator.of(context).pop();

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return validaciones(
                      context, "Eliminado", "pregunta eliminada con éxito");
                },
              );
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InicioMas(),
              ));
            }),
      ],
    );
  }
}
