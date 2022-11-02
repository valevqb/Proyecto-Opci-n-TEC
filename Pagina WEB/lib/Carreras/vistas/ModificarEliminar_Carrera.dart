import 'dart:io';

import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';
import 'package:opciontec/Carreras/vistas/carrera_inicio.dart';
import 'package:opciontec/Barra.dart';
import 'dart:convert';

import '../../locators.dart';

//import '../controladores/datos_eventos.dart';
//import 'Calendario.dart';

class ModificarCarrera extends StatefulWidget {
  final DataCarrera carreraSeleccionado;
  ModificarCarrera(this.carreraSeleccionado);

  @override
  // ignore: library_private_types_in_public_api
  _ModificarCarreraState createState() => _ModificarCarreraState();
}

class _ModificarCarreraState extends State<ModificarCarrera> {
  late DataCarrera _valor;
  var bandera = 0;
  TextEditingController nombre = TextEditingController();
  TextEditingController resumen = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController video = TextEditingController();
  TextEditingController sede = TextEditingController();
  TextEditingController grado = TextEditingController();
  TextEditingController horario = TextEditingController();
  TextEditingController corte = TextEditingController();
  TextEditingController acreditacion = TextEditingController();
  TextEditingController intereses1 = TextEditingController();
  TextEditingController habilidades1 = TextEditingController();
  TextEditingController areaLaboral1 = TextEditingController();
  var intereses = [];
  var habilidades = [];
  var areaLaboral = [];
  TextEditingController planEstudios = TextEditingController();
  var width = 0.0;
  GlobalKey llave = GlobalKey<FormState>();
  List<Map> sedes = [
    {"nombre": "Cartago", "revisado": false},
    {"nombre": "San José", "revisado": false},
    {"nombre": "Alajuela", "revisado": false},
    {"nombre": "San Carlos", "revisado": false},
    {"nombre": "Limón", "revisado": false}
  ];
  List<Map> grados = [
    {"nombre": "Bachillerato", "revisado": false},
    {"nombre": "Licenciatura", "revisado": false},
    {"nombre": "Maestría", "revisado": false},
    {"nombre": "Técnico", "revisado": false}
  ];
  List<Map> horarios = [
    {"nombre": "Diurno", "revisado": false},
    {"nombre": "Nocturno", "revisado": false}
  ];

  @override
  void initState() {
    width = 0.0;
    _valor = widget.carreraSeleccionado;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;

    if (bandera == 0) {
      nombre.text = _valor.Nombre!;
      resumen.text = _valor.Resumen!;
      descripcion.text = _valor.Descripcion!;
      video.text = _valor.IMG!;
      sede.text = _valor.Sede!;
      grado.text = _valor.Grado!;
      horario.text = _valor.Horario!;
      corte.text = _valor.Corte!;
      acreditacion.text = _valor.Acreditacion!;
      planEstudios.text = _valor.Plan!;
      intereses = _valor.Intereses!;
      habilidades = _valor.Habilidades!;

      intereses1.text = _valor.Intereses!.join(";");
      habilidades1.text = _valor.Habilidades!.join(";");

      selectedFiles(context, sedes, sede);
      selectedFiles(context, grados, grado);
      selectedFiles(context, horarios, horario);

      for (var i = 0; i < _valor.AreaLaboral?.total; i++) {
        if (areaLaboral1.text.toString().isEmpty) {
          areaLaboral1.text =
              "${(_valor.AreaLaboral?.areas?[i].Nombre.toString())!}: ${(_valor.AreaLaboral?.areas?[i].Opciones?.join(", ").toString())!}";
        } else {
          areaLaboral1.text =
              "${areaLaboral1.text}; ${(_valor.AreaLaboral?.areas?[i].Nombre.toString())!}${(_valor.AreaLaboral?.areas?[i].Opciones?.join(", ").toString())!}";
        }
      }
    }
    bandera = 1;

    return MaterialApp(
        title: "Modificar Carrera",
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
              title: const Text('Modificar carrera',
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
                                  child: const Text('Eliminar Carrera',
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
                          textTittle(context, "* Nombre"),
                          textInfo(context, "Escriba el nombre de la carrera"),
                          textForms(context, nombre, 0),
                          textTittle(context, "* Breve descripción"),
                          textInfo(
                              context, "Escriba los descripción de la carrera"),
                          textForms(context, resumen, 1),
                          textTittle(context, "* Video"),
                          textInfo(context, "Escriba el enlace de video"),
                          textForms(context, video, 2),
                          textTittle(context, "* Sedes"),
                          textInfo(context,
                              "Seleccione las sedes donde se impartirá la carrera"),
                          infoSede(),
                          textTittle(context, "* Grados"),
                          textInfo(
                              context, "Seleccione los grados de la carrera"),
                          infoGrado(),
                          textTittle(context, "* Horarios"),
                          textInfo(
                              context, "Seleccione los horarios de la carrera"),
                          infoHorario(),
                          textTittle(context, "* Corte"),
                          textInfo(context,
                              "Escriba la nota de corte para el examen de admisión del año anterior"),
                          textForms(context, corte, 5),
                          textTittle(context, "* Descripción extendida"),
                          textInfo(
                              context, "Escriba la descripción de la carrera"),
                          textForms(context, descripcion, 3),
                          textTittle(context, "* Acreditación"),
                          textInfo(context,
                              "Escriba los detalles sobre la acreditación"),
                          textForms(context, acreditacion, 4),
                          textTittle(context, "* Intereses"),
                          textInfo(context,
                              "Escriba los intereses de la carrera, sepárelos por ;"),
                          textForms(context, intereses1, 6),
                          textTittle(context, "* Habilidades"),
                          textInfo(context,
                              "Escriba los habilidades de la carrera, sepárelos por ;"),
                          textForms(context, habilidades1, 7),
                          textTittle(context, "* Area laboral"),
                          textInfo(context,
                              "Escriba el área laboral en el formato solicitado Nombre: Opción1, Opción2 (separe cada área por ;)"),
                          textForms(context, areaLaboral1, 8),
                          textTittle(context, "* Plan estudios"),
                          textInfo(context,
                              "Escriba el enlace de la imagen de plan de estudios"),
                          textForms(context, planEstudios, 9),
                          ModificarCarreraBotton(context),
                        ],
                      ),
                    ),
                  ))));
  }

  void selectedFiles(BuildContext context, datas, data) {
    datas.map((marked) {
      var nameData = data.text.toString().split(", ");
      var dataFinal = nameData[nameData.length - 1].toString().split(" y ");
      nameData = nameData + dataFinal;
      if (nameData.contains(marked["nombre"].toString())) {
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
              hintText: palabras.text.toString(),
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
              nombre.text = value.toString();
            } else if (tipo == 1) {
              resumen.text = value.toString();
            } else if (tipo == 2) {
              video.text = value.toString();
            } else if (tipo == 3) {
              descripcion.text = value.toString();
            } else if (tipo == 4) {
              acreditacion.text = value.toString();
            } else if (tipo == 5) {
              corte.text = value.toString();
            } else if (tipo == 6) {
              intereses = value.toString().split(";");
            } else if (tipo == 7) {
              habilidades = value.toString().split(";");
            } else if (tipo == 8) {
              //revisar como le funciona
              areaLaboral1.text = value.toString();
            } else if (tipo == 9) {
              planEstudios.text = value.toString();
            }
          },
        ));
  }

  Widget infoSede() {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sedes.map((sedeSeleccion) {
            return CheckboxListTile(
                value: sedeSeleccion["revisado"],
                title: Text(sedeSeleccion["nombre"]),
                onChanged: (newValue) {
                  setState(() {
                    sedeSeleccion["revisado"] = newValue;
                  });
                });
          }).toList(),
        ));
  }

  Widget infoGrado() {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: grados.map((gradoSeleccion) {
            return CheckboxListTile(
                value: gradoSeleccion["revisado"],
                title: Text(gradoSeleccion["nombre"]),
                onChanged: (newValue) {
                  setState(() {
                    gradoSeleccion["revisado"] = newValue;
                  });
                });
          }).toList(),
        ));
  }

  Widget infoHorario() {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: horarios.map((horarioSeleccion) {
            return CheckboxListTile(
                value: horarioSeleccion["revisado"],
                title: Text(horarioSeleccion["nombre"]),
                onChanged: (newValue) {
                  setState(() {
                    horarioSeleccion["revisado"] = newValue;
                  });
                });
          }).toList(),
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

  Widget ModificarCarreraBotton(BuildContext context) {
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
            try {
              var list = [];
              for (var element in sedes) {
                if (element["revisado"] == true) {
                  list.add(element["nombre"] + "," + " ");
                }
              }
              var listaFinal = list.join("");
              listaFinal = listaFinal.substring(0, listaFinal.length - 2);
              sede.text = listaFinal.toString();

              list = [];
              for (var element in grados) {
                if (element["revisado"] == true) {
                  list.add(element["nombre"] + "," + " ");
                }
              }
              listaFinal = list.join("");
              listaFinal = listaFinal.substring(0, listaFinal.length - 2);
              grado.text = listaFinal.toString();

              list = [];
              for (var element in horarios) {
                if (element["revisado"] == true) {
                  list.add(element["nombre"] + "," + " ");
                }
              }
              listaFinal = list.join("");
              listaFinal = listaFinal.substring(0, listaFinal.length - 2);
              horario.text = listaFinal.toString();

              var diferentesAreas = areaLaboral1.text
                  .toString()
                  .split(";"); //json de las areas laborales
              for (var i = 0; i < diferentesAreas.length; i++) {
                var separacion = diferentesAreas[i].toString().split(":");
                try {
                  var listaOpciones = separacion[1].toString().split(",");
                  areaLaboral.add(AreaLaboralCarrera(
                      separacion[0].toString(), listaOpciones));
                } catch (_) {}
              }

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
              "Modificar Carrera",
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
    String jsonTags = jsonEncode(areaLaboral); //json del area laboral

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
                  locator<DatosCarrera>()
                      .ModificarPregunta(
                          _valor.id,
                          nombre.text,
                          resumen.text,
                          descripcion.text,
                          video.text,
                          sede.text,
                          grado.text,
                          horario.text,
                          corte.text,
                          acreditacion.text,
                          jsonEncode(intereses),
                          jsonEncode(habilidades),
                          jsonEncode(areaLaboral),
                          "",
                          planEstudios.text,
                          "Tecnologia")
                      .then((value) => locator<DatosCarrera>().fetch().then(
                          (value) =>
                              locator<DatosCarrera>().fetch().then((value) => {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          PrototipoBarra(indexActual: 2),
                                    ))
                                  })));
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
          child: const Text('Eliminar carrera')),
      content: Text("Seguro que deseas eliminar la carrera ${nombre.text}"),
      actions: <Widget>[
        TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              locator<DatosCarrera>().EliminarCarrera(_valor.id).then(
                  (value) => locator<DatosCarrera>().fetch().then((value) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PrototipoBarra(indexActual: 2),
                        ));
                      }));
            }),
      ],
    );
  }
}
