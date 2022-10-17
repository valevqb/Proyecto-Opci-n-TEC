import 'package:flutter/material.dart';
import 'package:opciontec/Sesion/servicios/datos_Usuarios.dart';
import 'package:opciontec/Sesion/vistas/Editar_Sesion.dart';
import '../../Config.dart';

class VerLaSesion extends StatefulWidget {
  @override
  _VerLaSesionState createState() => _VerLaSesionState();
}

class _VerLaSesionState extends State<VerLaSesion> {
  var usuarios = Usuarios();
  var email = TextEditingController();
  var contra = TextEditingController();
  var nombreCompleto = TextEditingController();
  var width = 0.0;


  @override
  void initState() {
    width = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;

    return MaterialApp(
        title: "Ver sesión",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_circle_left_rounded,
                    size: 40.0, color: Color(0xFF1C2D4B)),
              ),
              centerTitle: true,
              title: const Text('Ver sesión',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 23.0),
                        height: 41,
                        width: 155,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/Fotos/VerSesion.png'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 4.0)),
                      letter(context, Config.Sesion.nombre.toString()),
                      const Padding(padding: EdgeInsets.only(top: 4.0)),
                      letter(context, Config.Sesion.correo.toString()),
                      const Padding(padding: EdgeInsets.only(top: 9.0)),
                      editarSesionBotton(context),
                      const Padding(padding: EdgeInsets.only(top: 9.0)),
                    ],
                  )),
            )));
  }

  Widget letter(BuildContext context, palabras){
    return Container(
        margin: const EdgeInsets.only(top: 32.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D)))
    );
  }

  Widget editarSesionBotton(BuildContext context){
    return SizedBox(
      width: width-24,
      child: Card(
        color: const Color(0xFFCBEFF7),
        elevation: 5,
        margin: const EdgeInsets.only(top: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditarSesion()),
            );
          },//codigo al presionarse
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text( "Modificar datos",
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)),
            ),
          ),
        ),
      ),
    );

  }
}