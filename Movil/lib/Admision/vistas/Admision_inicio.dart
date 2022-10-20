import 'package:flutter/material.dart';
import 'package:opciontec/Admision/controladores/datos_Admision.dart';
import 'package:opciontec/Admision/modelos/Admisiones.dart';
import 'package:opciontec/Admision/vistas/Info_Admin.dart';
import 'package:provider/provider.dart';

import '../../Config.dart';
import '../../Sesion/vistas/Login.dart';
import '../../Sesion/vistas/Ver_Sesion.dart';
import '../../locators.dart';

class InicioAdmision extends StatefulWidget {
  @override
  _InicioAdmisionState createState() => _InicioAdmisionState();
}

class _InicioAdmisionState extends State<InicioAdmision> {
  @override
  void initState() {
    super.initState();
    locator<DatosAdmisiones>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DataAdmisiones>? Admisiones =
        Provider.of<DatosAdmisiones>(context).admisiones;
    bool isLoading = Provider.of<DatosAdmisiones>(context).isLoading;
    return MaterialApp(
        title: "Pez Admin",
        theme: ThemeData(scaffoldBackgroundColor: Color(0xFF1C2D4B)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Admisión',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              elevation: 0,
              backgroundColor: Color(0xFF1C2D4B),
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
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
            ),
            body: (isLoading)
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: SizedBox(
                        height: height,
                        width: width,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: width,
                                      height: 230,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1C2D4B),
                                      ),
                                      child:
                                          Image.asset('lib/Fotos/Admision.png'),
                                    ),
                                    Container(
                                      width: width,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1C2D4B),
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                                child: Secciones(
                                                    texto:
                                                        '¿Cómo ingreso al TEC?',
                                                    tamano: 20.0,
                                                    font: FontWeight.bold,
                                                    width: width - 25)),
                                            Center(
                                                child: Secciones(
                                                    texto:
                                                        'Para estudiar una carrera de grado (bachillerato o licenciatura) podrás optar por tres opciones de ingreso.  \n\nCada una de ellas tiene periodos específicos para los procedimientos respectivos, los cuales se pueden encontrar en el Calendario de Admisión.',
                                                    tamano: 12.0,
                                                    font: FontWeight.normal,
                                                    width: width - 25)),
                                          ]),
                                    ),
                                    Container(
                                      width: width,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          topLeft: Radius.circular(50),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: const Text(
                                          "\n Opciones de ingreso",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1C2D4B))),
                                    ),
                                    SizedBox(
                                      height: height,
                                      child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListView.builder(
                                              itemCount: Admisiones!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  color:
                                                      const Color(0xFFCBEFF7),
                                                  elevation: 5,
                                                  margin: const EdgeInsets.only(
                                                      top: 15.0,
                                                      right: 30,
                                                      left: 30),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: InkWell(
                                                    //tooltip: 'Increase volume by 10',
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            Info_Admin(
                                                                Admisiones![
                                                                    index]),
                                                      ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 60,
                                                      child: Text(
                                                        Admisiones[index]
                                                            .Nombre!,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF1C2D4B)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })),
                                    ),
                                  ],
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                ));
                          },
                        )),
                  )));
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
      padding: const EdgeInsets.all(20),
      child: Text(texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: tamano, fontWeight: font, color: Colors.white)),
    );
  }
}
