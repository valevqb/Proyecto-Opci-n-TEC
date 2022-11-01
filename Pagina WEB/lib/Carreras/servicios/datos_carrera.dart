import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:http/http.dart' as http;
import '../../Config.dart';

class AreaLaboralCarrera {
  String nombre = "";
  List<String> opciones = [];

  AreaLaboralCarrera(this.nombre, this.opciones);

  Map toJson() => {
        'Nombre': nombre,
        'Opciones': opciones,
      };
}

class DatosCarrera extends ChangeNotifier {
  String carrerasURL = '${Config.dirServer}carreras';
  String agregarUrl = '${Config.dirServer}agregarCarrera';
  String eliminarUrl = '${Config.dirServer}eliminarCarrera';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataCarrera>? carreras = [];

  Future<List<DataCarrera>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(carrerasURL)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });

    if (result.statusCode == 200) {
      Map<String, dynamic> _datos = json.decode(result.body);

      var _carreras = _datos["Datos"];

      if (_carreras != null) {
        carreras = Carreras.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return carreras;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }

  Future<void> postCarrera(
      nombre,
      resumen,
      descripcion,
      imagen,
      sede,
      grado,
      horario,
      corte,
      acreditacion,
      intereses,
      habilidades,
      areaLaboral,
      areaCompleto,
      planEstudios,
      categoria) async {
    String interes = "";
    String habilidad = "";
    String areaLabora = "";
    intereses.forEach((element) => interes += "\"" + element + "\",");
    habilidades.forEach((element) => habilidad += element + ",");
    areaLaboral.forEach((element) => areaLabora += element + ",");

    final result = await http.post(Uri.parse(agregarUrl), body: {
      'Nombre': nombre,
      'Resumen': resumen,
      'Descripcion': descripcion,
      'Sede': sede,
      'Grado': grado,
      'Horario': horario,
      'Acreditacion': acreditacion,
      'Intereses': interes,
      'Habilidades': habilidad,
      'Area Laboral': areaLabora,
      'areaCompleto': areaCompleto,
      'Plan': planEstudios,
      'Corte': corte,
      'IMG': imagen,
      'Categoria': categoria
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

  Future<void> EliminarCarrera(id) async {
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
      id,
      nombre,
      resumen,
      descripcion,
      imagen,
      sede,
      grado,
      horario,
      corte,
      acreditacion,
      intereses,
      habilidades,
      areaLaboral,
      areaCompleto,
      planEstudios,
      categoria) async {
    postCarrera(
        nombre,
        resumen,
        descripcion,
        imagen,
        sede,
        grado,
        horario,
        corte,
        acreditacion,
        intereses,
        habilidades,
        areaLaboral,
        areaCompleto,
        planEstudios,
        categoria);
    EliminarCarrera(id);
  }
}
