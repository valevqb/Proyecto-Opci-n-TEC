class Carreras {
  List<DataCarrera>? datos;
  int? total;

  Carreras();

  Carreras.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(new DataCarrera.fromJson(v));
      });
    }

  }
}

class DataCarrera {
  String? Resumen;
  String? Grado;
  String? Acreditacion;
  String? Corte;
  String? Categoria;
  AreasLaborales? AreaLaboral;
  String? Descripcion;
  List<dynamic>? Habilidades;
  String? Horario;
  List<dynamic>? Intereses;
  String? Nombre;
  String? Sede;
  String? IMG;
  int? id;
  DataCarrera({this.Grado, this.Categoria, this.AreaLaboral, this.Resumen, this.Acreditacion, this.Corte, this.Descripcion, this.Habilidades, this.Horario,this.Intereses,this.Nombre,this.Sede,this.IMG});

  DataCarrera.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    Resumen = json['info']['Resumen'];
    Grado = json['info']['Grado'];
    Categoria = json['info']['Categoria'];
    Acreditacion = json['info']['Acreditacion'];
    Corte = json['info']['Corte'];
    AreaLaboral = AreasLaborales.fromJson(json['info']['Area Laboral']);
    Descripcion = json['info']['Descripcion'];
    Habilidades= json['info']['Habilidades'];
    Horario = json['info']['Horario'];
    Intereses = json['info']['Intereses'];
    Nombre = json['info']['Nombre'];
    Sede = json['info']['Sede'];
    IMG = json['info']['IMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Categoria' ] = Categoria;
    data[ 'Grado' ] = Grado;
    data[ 'Acreditacion' ] = Acreditacion;
    data[ 'Cortes' ] = Corte;
    data[ 'Resumen' ] = Resumen;
    data[ 'Area Laboral' ] = AreaLaboral;
    data[ 'Descripcion' ] = Descripcion;
    data[ 'Habilidades' ]= Habilidades;
    data[ 'Horario' ] = Horario;
    data[ 'Intereses' ] = Intereses;
    data[ 'Nombre' ] = Nombre;
    data[ 'Sede' ] = Sede;
    data[ 'IMG' ] = IMG;
    return data;

  }
}

class AreasLaborales {
  List<DataAreaLaboral>? areas = [];
  int? total;

  AreasLaborales();

  AreasLaborales.fromJson(List<dynamic> json) {
    if(json.isNotEmpty) {
      json.forEach((v) {
        areas!.add(new DataAreaLaboral.fromJson(v));
      });
    }
  }
}

class DataAreaLaboral {
  String? Nombre;
  List<dynamic>? Opciones;

  DataAreaLaboral({this.Nombre, this.Opciones});

  DataAreaLaboral.fromJson(Map<String, dynamic> json) {

    Nombre = json['Nombre'];
    Opciones = json['Opciones'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'Nombre' ] = Nombre;
    data[ 'Opciones' ] = Opciones;
    return data;

  }
}
