import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Mas/modelos/Preguntas.dart';
import 'package:http/http.dart' as http;

import '../../Config.dart';

class DatosPreguntas extends ChangeNotifier {
  String preguntasUrl = '${Config.dirServer}preguntas';

  String agregarUrl = "${Config.dirServer}agregarPregunta";

  String eliminarUrl = "${Config.dirServer}eliminarPregunta";

  String modificarUrl = "${Config.dirServer}cambiarPregunta";

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<List<DataPreguntas>>? preguntas = [];
  Future<List<List<DataPreguntas>>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(preguntasUrl)).catchError((e) {
      print("Error Fetching Users$e");
    });

    if (result.statusCode == 200) {
      Map<String, dynamic> _datos = json.decode(result.body);

      var _preguntas = _datos["Datos"];

      if (_preguntas != null) {
        preguntas = Preguntas.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return preguntas;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }

  Future<void> postPregunta(pregunta, respuesta, IMG, enlaces, tema) async {
    String enlaza = "";
    enlaces.forEach((element) => enlaza += element + ",");
    enlaza = enlaza.substring(0, enlaza.length - 2);

    final result = await http.post(Uri.parse(agregarUrl), body: {
      'pregunta': pregunta,
      'respuesta': respuesta,
      'IMG': IMG,
      'enlaces': enlaza,
      'tema': tema,
    }).catchError((e) {
      if (kDebugMode) {
        print("Error Fetching Users$e");
      }
    });

    if (result.statusCode == 200) {
      if (result.body == "8000") {
        Config.error = "Pregunta registrada satisfactoriamente";
      } else {
        Config.error = "Pregunta Existente";
      }
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }

  Future<void> EliminarPregunta(id) async {
    final result = await http
        .post(Uri.parse(eliminarUrl), body: {'id': "$id"}).catchError((e) {
      if (kDebugMode) {
        print("Error Fetching Users$e");
      }
    });
    if (result.body == "8000") {
      Config.error = "Evento Eliminado satisfactoriamente";
    } else {
      Config.error = "Evento Existente";
    }
  }

  Future<void> ModificarPregunta(
      id, pregunta, respuesta, IMG, enlaces, tema) async {
    postPregunta(pregunta, respuesta, IMG, enlaces, tema);
    EliminarPregunta(id);
  }
}
