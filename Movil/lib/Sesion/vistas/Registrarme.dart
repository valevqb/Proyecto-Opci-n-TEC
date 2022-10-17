import 'package:flutter/material.dart';
import 'package:opciontec/Sesion/servicios/datos_Usuarios.dart';
import '../../Config.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
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
    double height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "Crear cuenta",
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
              title: const Text('Iniciar sesión',
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
                        height: 181.95,
                        width: 234.25,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/Fotos/Registro.png'),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 33.0),
                          child: const Text('Completa la siguiente información',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2B436D)))
                      ),
                      letter(context, "Nombre completo"),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxTextNombre(context, "Escribe tu nombre"),
                      letter(context, "Correo"),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxTextCorreo(context, "Escribe tu correo"),
                      letter(context, "Contraseña"),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      boxTextContra(context, "Escribe tu contraseña"),
                      RegistroBotton(context)
                    ],
                  )),
            )));
  }

  Widget letter2(BuildContext context, palabras){
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D)))
    );
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

  Widget boxTextNombre(BuildContext context, palabras){
    return SizedBox(
        width: width-24.0,
        child: TextField(
          controller: nombreCompleto,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )
    );
  }

  Widget boxTextCorreo(BuildContext context, palabras){
    return SizedBox(
        width: width-24.0,
        child: TextField(
          controller: email,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )
    );
  }

  Widget boxTextContra(BuildContext context, palabras){
    return SizedBox(
        width: width-24.0,
        child: TextField(
          obscureText: true,
          obscuringCharacter: '*',
          controller: contra,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )
    );
  }

  Widget RegistroBotton(BuildContext context){
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
            if (nombreCompleto.text.toString().isEmpty || email.text.toString().isEmpty || contra.text.toString().isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return validaciones(context, "Error", "Debe escribir el email, la contraseña y el nombre");
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return aceptacion(context);
                },
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text( "Registrarme",
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

  Widget validaciones(BuildContext context, titulo, palabras) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(titulo.toString(),
              style: const TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)))),
      content: Text(palabras.toString(),
          style: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Color(0xFF1C2D4B))),
      actions: <Widget>[
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  Widget aceptacion(BuildContext context) {
    return AlertDialog(
      title: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: const Text('Confirmar datos',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2D4B))),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, children: [
        letter2(context, "* Confirme que los datos sean correctos *"),
        letter2(context, "Nombre Completo: ${nombreCompleto.text}"),
        letter2(context, "Email: ${email.text}"),
        const SizedBox(height: 30),
        Row(
          children: [
            TextButton(
                child: const Text("Aceptar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  usuarios
                      .registrar(nombreCompleto.text.toString(),
                      email.text.toString(), contra.text.toString())
                      .then((value) {
                    if (Config.error.toString() == "Usuario Existente"){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return validaciones(context, "Error", "El email ya se encuentra registrado, favor ingresar");
                        },
                      );
                    } else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return validaciones(context, "Registrado", "El nuevo usuario fue registrado con éxito");
                        },
                      );
                    }
                  });
                }),
            TextButton(
                child: const Text("Modificar"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        )
      ]),
    );
  }
}
