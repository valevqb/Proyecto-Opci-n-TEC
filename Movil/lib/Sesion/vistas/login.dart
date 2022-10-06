import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:opciontec/Carreras/vistas/Info_Carreras.dart';
import 'package:opciontec/Admision/vistas/Admision_inicio.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:opciontec/Sesion/vistas/Registrarme.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final controller = TextEditingController();
  var width = 0.0;
  TextEditingController _textFieldController = TextEditingController();

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
        title: "Iniciar sesión",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
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
              backgroundColor: Colors.white,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 23.0),
                        height: 181.95,
                        width: 234.25,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/Fotos/LogIn.png'),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 33.0),
                          child: Text('Completa la siguiente información',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2B436D)))
                      ),
                      letter(context, "Correo"),
                      Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxText(context, "Escribe tu correo"),
                      letter(context, "Contraseña"),
                      Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxText(context, "Escribe tu contraseña"),
                      logInBotton(context),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      InkWell(
                        onTap: () {
                          olvideContrasenia(context);
                        },
                        child: Container(
                            child: Text('¿Olvidaste la contraseña?',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF2B436D)))
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registro()),
                          );
                        },
                        child: Container(
                            child: Text('Registrarme',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF2B436D)))
                        ),
                      )
                    ],
                  )),
            )));
  }

  Widget letter(BuildContext context, palabras){
    return Container(
        margin: const EdgeInsets.only(top: 32.0),
        child: Text(palabras.toString(),
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D)))
    );
  }

  Widget boxText(BuildContext context, palabras){
    return SizedBox(
        width: width-24.0,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              //color: Color(0xFFF0F2F5),
            ),
            filled: true,
            fillColor: Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            //prefixIcon: const Icon(Icons.search_rounded,
            //size: 20.0, color: Color(0xBE5CC6DE))
          ),
        )
    );
  }

  Widget logInBotton(BuildContext context){
    return SizedBox(
      width: width-24,
      child: Card(
        color: Color(0xFFCBEFF7),
        elevation: 5,
        margin: EdgeInsets.only(top: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: Text( "Iniciar sesión",
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)),
            ),
          ),
        ),
      ),
    );

  }

  Future<void> olvideContrasenia(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Recuperar contraseña',
                style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2D4B))),
            content: TextField(
              onChanged: (value) {

              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Escribe tu correo",
                hintStyle: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)
                )),
            ),
            actions: <Widget>[
              /*FlatButton(
                color: Color(0xFF2B436D),
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),*/
            ],
          );
        });
  }
}


