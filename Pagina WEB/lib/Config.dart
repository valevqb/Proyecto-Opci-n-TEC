import 'package:opciontec/Sesion/modelo/usuario.dart' show Usuario;

class Config {
  static var dirServer = "http://10.147.19.252:3000/api/";
  //static var dirServer = "http://10.147.19.188:3000/api/";
  //static var dirServer = "http://10.147.19.78:3000/api/";
  //static var dirServer = "http://192.168.18.13:3000/api/";
  static Usuario Secion = Usuario();
  static String error = "";
}
