import 'package:flutter/material.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:opciontec/Mas/modelos/Preguntas.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../locators.dart';
import 'package:opciontec/Mas/vistas/ModificarEliminar_Pregunta.dart';
import 'package:url_launcher/url_launcher.dart';

class Info_Pregunta extends StatefulWidget {
  final DataPreguntas PreguntaSelec_par;

  Info_Pregunta(this.PreguntaSelec_par);

  @override
  _Info_PreguntaState createState() => _Info_PreguntaState();
}

class _Info_PreguntaState extends State<Info_Pregunta> {
  late DataPreguntas PreguntaSelec;

  @override
  void initState() {
    super.initState();
    PreguntaSelec = this.widget.PreguntaSelec_par;
    locator<DatosPreguntas>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String Categoria = "Pregunta frecuente de ${PreguntaSelec.Categoria}";

    bool isLoading = Provider.of<DatosPreguntas>(context).isLoading;
    return MaterialApp(
      title: "Pez Info becas",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_circle_left_rounded,
                size: 40.0, color: Colors.lightBlue),
          ),
          title: Text(Categoria,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
        ),
        body: (isLoading)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: width - 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        width: (width - 50) / 5,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: Secciones(
                      texto: PreguntaSelec.Pregunta.toString(),
                      tamano: 20.0,
                      width: width - 25,
                      color: Colors.blue.shade900)),
              Center(
                  child: Secciones(
                      texto: PreguntaSelec.Respuesta.toString(),
                      tamano: 12.0,
                      width: width - 25,
                      color: Colors.black87)),

              Center(
                  child: SizedBox(
                    width: width - 40,
                    child: FloatingActionButton.extended(
                      heroTag: UniqueKey(),
                      label: Text('Leer más',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)),
                      // <-- Text
                      backgroundColor: Colors.lightBlue.shade200,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15.0))),
                      icon: const Icon(
                        // <-- Icon
                        Icons.chrome_reader_mode_outlined,
                        size: 24.0,
                      ),
                      onPressed: () {
                        launchUrlString(
                            "https://www.tec.ac.cr/preguntas-frecuentes");
                      },
                    ),
                  )),
              editarEliminarPregunta(context, PreguntaSelec)
            ],
          ),
        ),
      ),
    );
  }
}

Widget editarEliminarPregunta (BuildContext context, _valor){
  double width = MediaQuery.of(context).size.width;
  return Container(
    alignment: Alignment.topRight,
    margin: const EdgeInsets.only(right: 24, bottom: 10, top: 20),
    child: SizedBox(
      height: 50,
      width: (width - 40) / 4,
      child: FloatingActionButton.extended(
        label: const Text('Editar Pregunta',
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
            builder: (context) => ModificarPregunta(_valor),
          ));
        },
      ),
    ),
  );
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  double width = 50;
  Color color = Colors.blue.shade900;

  Secciones({
    required this.texto,
    required this.tamano,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Text(texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: tamano,
              fontWeight: FontWeight.bold,
              color: color)),
    );
  }
}
