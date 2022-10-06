import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Admision/modelos/Admisiones.dart';
import 'package:http/http.dart' as http;
import '../../Config.dart';

class DatosAdmisiones extends ChangeNotifier {
  String userUrl = Config.dirServer + 'admision';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataAdmisiones>? admisiones = [];

  Future<List<DataAdmisiones>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });

    if (result.statusCode == 200) {
      Map<String, dynamic> _datos = json.decode(result.body);

      var _admisiones = _datos["Datos"];

      if (_admisiones != null) {
        admisiones = Admisiones.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return admisiones;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }

    admisiones!.forEach((element) {
      print(element);
    });
  }
}
