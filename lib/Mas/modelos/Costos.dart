class Costos {
  List<DataCostos>? datos;
  int? total;

  Costos();

  Costos.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(new DataCostos.fromJson(v));
      });
    }
    datos!.forEach((element) {
      print(element.Nombre);
    });
  }
}

class DataCostos {
  String? Nombre;
  String? Un_Credito;
  String? Tope;
  String? Matricula;
  String? BienestarEstudiantil;
  String? Descripcion;
  String? Color;
  int? id;

  DataCostos(
      {this.Nombre,
      this.Un_Credito,
      this.Tope,
      this.Matricula,
      this.BienestarEstudiantil,
      this.Descripcion});

  DataCostos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Nombre = json['info']['Nombre'];
    Un_Credito = json['info']['Un_Credito'];
    Tope = json['info']['Tope'];
    Matricula = json['info']['Matricula'];
    BienestarEstudiantil = json['info']['BienestarEstudiantil'];
    Descripcion = json['info']['Descripcion'];
    Color = json['info']['Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Nombre'] = Nombre;
    data['Un_Credito'] = Un_Credito;
    data['Tope'] = Tope;
    data['Matricula'] = Matricula;
    data['BienestarEstudiantil'] = BienestarEstudiantil;
    data['Descripcion'] = Descripcion;
    data['Color'] = Color;
    return data;
  }
}
