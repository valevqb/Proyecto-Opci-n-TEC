import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:opciontec/Sesion/modelo/usuario.dart';

import '../../Config.dart';

/*
    5000 contrasena incorrecta
    6000 usuario inexistente
    7000 usuario existente
    8000 usuario registrado satisfactoriamente
*/
class Usuarios extends ChangeNotifier {
  String login = '${Config.dirServer}inicio_Secion';
  String register = '${Config.dirServer}registrar';

  static String error = "";

  Future<void> inicia_secion(correo, contrasena) async {
    final result = await http.post(Uri.parse(login),
        body: {'correo': correo, 'contrasena': contrasena}).catchError((e) {
      if (kDebugMode) {
        print("Error Fetching Users$e");
      }
    });

    if (result.body == "6000" || result.body == "5000") {
      Config.error = "Error credenciales";
    } else {
      Config.Sesion = Usuario.fromJson(jsonDecode(result.body));
      Config.Sesion.contrasena = contrasena;
      Config.error = "Inicio de sesión exitoso";
    }
  }

  Future<void> registrar(nombre, correo, contrasena) async {
    final result = await http.post(Uri.parse(register), body: {
      'nombre': nombre,
      'correo': correo,
      'apellido': " ",
      'contrasena': contrasena
    }).catchError((e) {
      if (kDebugMode) {
        print("Error Fetching Users$e");
      }
    });
    if (result.body == "8000") {
      Config.error = "Usuario registrado satisfactoriamente";
    } else {
      Config.error = "Usuario Existente";
    }
  }
}
