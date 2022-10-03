import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:opciontec/Carreras/vistas/Info_Carreras.dart';
import 'package:opciontec/Admision/vistas/Admision_inicio.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:opciontec/Sesion/vistas/login.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;

    return MaterialApp(
        title: "Iniciar sesión",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Iniciar sesión',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.account_circle_sharp,
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
            ),
            body: (isLoading)
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(width :115, height: 70 ,'lib/Fotos/LogIn.png'),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            height: 42,
                            width: width - 25,
                            padding: const EdgeInsets.only(left: 20),
                            margin: EdgeInsets.symmetric(
                                horizontal: width / 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xFFDCDCDC),
                                //style: BorderStyle.solid,
                                width: 1,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controller,
                                textAlignVertical:
                                TextAlignVertical.center,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                            .withOpacity(0.5)),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: const Icon(
                                        Icons.search_rounded,
                                        size: 20.0,
                                        color: Color(0xBE5CC6DE))),
                              ),
                            )),
                      ),
                      Center(
                        child: Container(
                          width: width - 50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(6.0)),
                            color: Color(0xFFCBEFF7),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(width :(width/2)-75 ,'lib/Fotos/Start.png'),
                              Container(
                                width: 3 * (width - 80) / 5,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                    Text('¿Harás el examen de admisión?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C2D4B))),
                                    Text(
                                        'Lee los pasos que debes seguir para inscribirte',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C2D4B))),
                                    new IconButton(
                                      icon: const Icon(
                                          Icons
                                              .arrow_circle_right_rounded,
                                          size: 40.0,
                                          color: Colors.lightBlueAccent),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              InicioAdmision(),
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisSize: MainAxisSize.max,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 80,
                          width: width - 50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(6.0)),
                            color: Colors.indigo.shade50,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 3 * (width - 50) / 5,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Calendario',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C2D4B))),
                                    Text(
                                        'Mira el resto de fechas importantes que debes tomar en cuenta',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C2D4B))),
                                  ],
                                ),
                              ),
                              new IconButton(
                                icon: const Icon(
                                    Icons.arrow_circle_right_rounded,
                                    size: 40.0,
                                    color: Color(0xBE3154E5)),
                                onPressed: () {
                                  /*
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Calendario(),
                              ));*/
                                },
                              ),
                            ],


                          ),
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
