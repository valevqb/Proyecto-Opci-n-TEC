class Admisiones {
  List<DataAdmisiones>? datos;
  int? total;

  Admisiones();

  Admisiones.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];

    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(new DataAdmisiones.fromJson(v));
      });
    }
  }
}

class DataAdmisiones {
  String? Nombre;
  String? Descripcion;
  List<dynamic>? Pasos;
  int? id;

  DataAdmisiones({this.Nombre, this.Descripcion, this.Pasos});

  DataAdmisiones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Nombre = json['info']['Nombre'];
    Descripcion = json['info']['Descripcion'];
    Pasos = json['info']['Pasos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Nombre'] = Nombre;
    data['Descripcion'] = Descripcion;
    data['Pasos'] = Pasos;
    return data;
  }
}

class DataAdmisionesPasos {
  String? Nombre_paso;
  String? Descripcion_paso;
  String? Enlace_paso;

  DataAdmisionesPasos(
      {this.Nombre_paso, this.Descripcion_paso, this.Enlace_paso});

  DataAdmisionesPasos.fromJson(Map<String, dynamic> json) {
    print(json);
    Nombre_paso = json['Pasos']['Nombre_paso'];
    Descripcion_paso = json['Pasos']['Descripcion_paso'];
    Enlace_paso = json['Pasos']['Enlace_paso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pasos']['Nombre_paso'] = Nombre_paso;
    data['Pasos']['Descripcion_paso'] = Descripcion_paso;
    data['Pasos']['Enlace_paso'] = Enlace_paso;
    return data;
  }
}
