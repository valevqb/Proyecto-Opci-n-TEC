import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:http/http.dart' as http;
import 'package:opciontec/Carreras/modelos/usuario.dart';
import '';
import '../../Config.dart';

class DatosCarrera extends ChangeNotifier {
  String userUrl = Config.dirServer + 'inicio_Secion';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late Usuario usuario;

  inicia_secion(_correo, _contrasena) async {
    final result = await http.post(Uri.parse(userUrl),
        body: {'correo': _correo, 'contrasena': _contrasena}).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });
  }
}
