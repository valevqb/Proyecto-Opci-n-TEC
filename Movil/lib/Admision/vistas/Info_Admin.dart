import 'package:flutter/material.dart';
import 'package:opciontec/Admision/controladores/datos_Admision.dart';
import 'package:opciontec/Admision/modelos/Admisiones.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../locators.dart';
import 'package:url_launcher/url_launcher.dart';

class Info_Admin extends StatefulWidget {
  final DataAdmisiones AdmisionesSelec_par;

  Info_Admin(this.AdmisionesSelec_par);

  @override
  _Info_AdminState createState() => _Info_AdminState();
}

class _Info_AdminState extends State<Info_Admin> {
  late DataAdmisiones AdmisionesSelec;

  @override
  void initState() {
    super.initState();
    AdmisionesSelec = this.widget.AdmisionesSelec_par;
    locator<DatosAdmisiones>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int _index = 0;
    int num_pasos = AdmisionesSelec.Pasos!.length;

    List<Step> lista_pasos = [];

    AdmisionesSelec.Pasos!.forEach((element) {
      //print(element['Nombre_paso']);
      lista_pasos.add(Step(
        isActive: true,
        title: Text(element['Nombre_paso']),
        subtitle: Text(element['Descripcion_paso']),
        content: TextButton(
          child: Text("Más información",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.lightBlueAccent)),
          style: TextButton.styleFrom(primary: Color(0xFFCBEFF7)),
          onPressed: () {
            launchUrlString("https://www.tec.ac.cr/otras-formas-ingreso");
          },
        ), // this is the issue
      ));
    });

    bool isLoading = Provider.of<DatosAdmisiones>(context).isLoading;
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
                size: 40.0, color: Color(0xFFCBEFF7)),
          ),
          title: const Text("Admisión",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          elevation: 0,
          backgroundColor: Color(0xFF1C2D4B),
        ),
        body: (isLoading)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: width - 50,
                        margin: const EdgeInsets.only(top: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Color(0xFFCBEFF7),
                        ),
                        child: Column(
                          children: <Widget>[
                            Secciones(
                              texto: AdmisionesSelec.Nombre.toString(),
                              tamano: 20.0,
                              width: width - 25,
                              font: FontWeight.bold,
                            ),
                            Secciones(
                              texto: AdmisionesSelec.Descripcion.toString(),
                              tamano: 14,
                              width: width - 25,
                              font: FontWeight.normal,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),
                    ),
                    Center(
                        child: Secciones(
                      texto: "Pasos para inscribirse",
                      tamano: 20,
                      width: width - 25,
                      font: FontWeight.bold,
                    )),
                    MyStatefulWidget(lista_pasos: lista_pasos),
                  ],
                ),
              ),
      ),
    );
  }
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  double width = 50;
  FontWeight font = FontWeight.normal;

  Secciones({
    required this.texto,
    required this.tamano,
    required this.width,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: this.tamano,
              fontWeight: this.font,
              color: Color(0xFF1C2D4B))),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  //const MyStatefulWidget({super.key});
  List<Step> lista_pasos = [];

  MyStatefulWidget({
    required this.lista_pasos,
  });

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(lista_pasos_par: this.lista_pasos);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;
  List<Step> lista_pasos_par = [];

  _MyStatefulWidgetState({
    required this.lista_pasos_par,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(

      currentStep: _index,
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (context,_) {
        return Row(
          children: <Widget>[
            /*
            TextButton(
              onPressed: (){
                if (_index >= 0 && _index <= lista_pasos_par.length-2) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              child: const Text('Siguiente paso',style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xFF1C2D4B))),
            ),
            TextButton(
              onPressed: (){
                if (_index > 0 ) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              child: const Text('Paso anterior',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1C2D4B))),
            ),
       // */
          ],
        );
      },
      steps: this.lista_pasos_par,
    );
  }
}
