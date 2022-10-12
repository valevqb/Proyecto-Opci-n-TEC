import 'package:flutter/material.dart';
import 'package:opciontec/Sesion/vistas/Registrarme.dart';
import 'package:opciontec/Sesion/servicios/datos_Usuarios.dart';

import '../../Config.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var usuarios = Usuarios();
  var email = TextEditingController();
  var contra = TextEditingController();
  var width = 0.0;
  final TextEditingController _textFieldController = TextEditingController();
  @override
  void initState() {
    width = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
        title: "Iniciar sesión",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Iniciar sesión',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
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
                          child: const Text('Completa la siguiente información',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2B436D)))),
                      letter(context, "Correo"),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxTextCorreo(context, "Escribe tu correo"),
                      letter(context, "Contraseña"),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxTextContra(context, "Escribe tu contraseña"),
                      logInBotton(context),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      InkWell(
                          onTap: () {
                            olvideContrasenia(context);
                          },
                          child: const Text('¿Olvidaste la contraseña?',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF2B436D)))),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registro()),
                            );
                          },
                          child: const Text('Registrarme',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2B436D)))),
                    ],
                  )),
            )));
  }

  Widget letter(BuildContext context, palabras) {
    return Container(
        margin: const EdgeInsets.only(top: 32.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))));
  }

  Widget boxTextCorreo(BuildContext context, palabras) {
    return SizedBox(
        width: width - 24.0,
        child: TextField(
          controller: email,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  Widget boxTextContra(BuildContext context, palabras) {
    return SizedBox(
        width: width - 24.0,
        child: TextField(
          controller: contra,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  Widget logInBotton(BuildContext context) {
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
            if (contra.text.toString().isEmpty ||
                email.text.toString().isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return validaciones(context);
                },
              );
            } else {
              usuarios
                  .inicia_secion(email.text.toString(), contra.text.toString())
                  .then((value) => print(Config.error));
            } //codigo al presionarse
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text(
              "Iniciar sesión",
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16.0,
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
            contentPadding: const EdgeInsets.only(bottom: 0),
            title: const Text('Recuperar contraseña',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2D4B))),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: "Escribe tu correo",
                  hintStyle: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5))),
            ),
            actions: const <Widget>[
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

  Widget validaciones(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: const Text('Error')),
      content: const Text("Debe escribir el email y la contraseña"),
      actions: <Widget>[
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
