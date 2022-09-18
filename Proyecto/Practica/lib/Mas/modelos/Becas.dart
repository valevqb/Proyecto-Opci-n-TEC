import 'package:tuple/tuple.dart';
class Becas {
  List<DataBecas>? datos;
  int? total;

  Becas();

  Becas.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(new Becas.fromJson(v));
      });
    }
    ///  support =
    // json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

}

class DataBecas {
  String? Nombre;
  String? Categoria;
  String? Descripcion;
  List<dynamic>? Requisitos;
  List<dynamic>? Beneficios;
  int? id;

  DataBecas({this.Nombre, this.Categoria, this.Descripcion, this.Requisitos, this.Beneficios});

  DataBecas.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    Nombre = json['info']['Nombre'];
    Categoria = json['info']['Categoria'];
    Descripcion = json['info']['Descripcion'];
    Requisitos = json['info']['Requisitos'];
    Beneficios= json['info']['Beneficios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Nombre' ] = Nombre;
    data[ 'Categoria' ] = Categoria;
    data[ 'Descripcion' ] = Descripcion;
    data[ 'Requisitos' ] = Requisitos;
    data[ 'Beneficios' ]= Beneficios;
    return data;
  }
}
