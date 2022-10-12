class Usuario {
  int? id;
  String? nombre;
  String? apellido;
  String? carrera;
  String? correo;
  String? contrasena;

  Usuario({this.id, this.nombre, this.apellido, this.carrera, this.correo});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellido = json['Apellido'];
    carrera = json['Carrera'];
    correo = json['Correo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['Apellido'] = apellido;
    data['Carrera'] = carrera;
    data['Correo'] = correo;
    return data;
  }
}
