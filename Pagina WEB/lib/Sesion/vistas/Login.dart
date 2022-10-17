import 'package:flutter/material.dart';
import 'package:opciontec/Sesion/servicios/datos_Usuarios.dart';
import 'package:opciontec/Barra.dart';
import 'dart:math';
import '../../Config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var usuarios = Usuarios();
  var email = TextEditingController();
  var contra = TextEditingController();
  var width = 0.0;
  var emailRecuperacion = TextEditingController();
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
          obscureText: true,
          obscuringCharacter: '*',
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
                  return validaciones(context, "Error", "Debe escribir el email y la contraseña");
                },
              );
            } else {
              usuarios
                  .inicia_secion(email.text.toString(), contra.text.toString())
                  .then((value) {
                    if (Config.error.toString() == "Error credenciales"){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return validaciones(context, "Error", "Contraseña o correo incorrecto");
                        },
                      );
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return validaciones(
                              context, "Bienvenido", "Ingreso exitoso");
                        },
                      );
                    }
                  });
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

  Widget olvideContrasenia(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: const Text('Cambiar contraseña',
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black))),
      content: TextField(
        controller: emailRecuperacion,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          filled: true,
          fillColor: const Color(0xFFF0F2F5),
          hintText: "Escriba su correo",
          hintStyle: TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.5)
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text("Aceptar"),
            onPressed: (){
              var contrasenaNueva =  String.fromCharCodes(List.generate(8, (index)=> Random().nextInt(33) + 89));
              sendE(contrasenaNueva.toString());
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  Widget validaciones(BuildContext context, titulo, message) {
    print(titulo.toString());
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
              if(titulo.toString() == "Bienvenido"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrototipoBarra()),
                );
              }
            }),
      ],
    );
  }

  Future sendE(password) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final respuesta = await http.post(
        url,
        headers: {
          "origin" : "http://localhost",
          "Content-Type": "application/json",
        },
        body: json.encode({
          'service_id': "service_qju8wtt",
          'template_id': "template_erpv19v",
          'user_id': "jMQLpyk_PI7R3m6_v",
          'template_params':{
            "reply_to": emailRecuperacion.text.toString(),
            "subject": "Recuperación de contraseña",
            "to_name": "usuario(a)",
            "message": "Su nueva contraseña es: " + password
          }
        })
    );
  }

}
