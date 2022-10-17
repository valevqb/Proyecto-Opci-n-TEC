import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Mas/modelos/Costos.dart';
import 'package:http/http.dart' as http;
import 'package:opciontec/Calendario/modelos/eventos.dart';

import '../../Config.dart';

class DatosEventos extends ChangeNotifier {
  String eventosUrl = Config.dirServer + 'Eventos';
  String posteventosUrl = Config.dirServer + 'Eventos';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataEventos>? eventos = [];

  Future<List<DataEventos>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(eventosUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });

    if (result.statusCode == 200) {
      Map<String, dynamic> _datos = json.decode(result.body);

      var _eventos = _datos["Datos"];

      if (_eventos != null) {
        eventos = Eventos?.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return eventos;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }

  Future<void> postEvento(nombre, inicio, fin, descripcion, estododia) async {
    final result = await http.post(Uri.parse(posteventosUrl), body: {
      'nombre': nombre,
      'fechainicio': inicio,
      'fechafin': fin,
      'estododia': estododia,
      'descripcion': descripcion
    }).catchError((e) {
      if (kDebugMode) {
        print("Error Fetching Users$e");
      }
    });
    if (result.body == "8000") {
      Config.error = "Evento registrado satisfactoriamente";
    } else {
      Config.error = "Evento Existente";
    }
  }
}
