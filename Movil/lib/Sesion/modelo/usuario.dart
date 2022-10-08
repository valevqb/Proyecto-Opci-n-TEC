class Data {
  int? id;
  String? nombre;
  String? Apellido;
  String? Carrera;
  String? Correo;

  Data({this.id, this.nombre, this.Apellido, this.Carrera, this.Correo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    Apellido = json['Apellido'];
    Carrera = json['Carrera'];
    Correo = json['Correo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['Apellido'] = this.Apellido;
    data['Carrera'] = this.Carrera;
    data['Correo'] = this.Correo;
    return data;
  }
}
