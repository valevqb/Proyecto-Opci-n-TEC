import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

class EditarSesion extends StatefulWidget {
  @override
  _EditarSesionState createState() => _EditarSesionState();
}

class _EditarSesionState extends State<EditarSesion> {
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
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;

    return MaterialApp(
        title: "Crear cuenta",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Iniciar sesión',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2D4B))),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_sharp,
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: (isLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
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
                                child: const Text(
                                    'Completa la siguiente información',
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF2B436D)))),
                            letter(context, "Nombre completo"),
                            const Padding(padding: EdgeInsets.only(top: 12.0)),
                            boxTextNombre(context, "Escribe tu nombre"),
                            letter(context, "Correo"),
                            const Padding(padding: EdgeInsets.only(top: 12.0)),
                            boxTextCorreo(context, "Escribe tu correo"),
                            letter(context, "Contraseña"),
                            const Padding(padding: EdgeInsets.only(top: 12.0)),
                            boxTextContra(context, "Escribe tu contraseña"),
                            EditarSesionBotton(context)
                          ],
                        )),
                  )));
  }

  Widget letter(BuildContext context, palabras) {
    return Container(
        margin: const EdgeInsets.only(top: 32.0),
        child: Text(palabras.toString(),
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))));
  }

  Widget boxTextNombre(BuildContext context, palabras) {
    return SizedBox(
        width: width - 24.0,
        child: TextField(
          controller: nombreCompleto,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  Widget boxTextCorreo(BuildContext context, palabras) {
    return SizedBox(
        width: width - 24.0,
        child: TextField(
          controller: email,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: Color(0xFFF0F2F5),
            hintText: palabras,
            hintStyle: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  Widget boxTextContra(BuildContext context, palabras) {
    return SizedBox(
        width: width - 24.0,
        child: TextField(
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
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  Widget EditarSesionBotton(BuildContext context) {
    return SizedBox(
      width: width - 24,
      child: Card(
        color: const Color(0xFFCBEFF7),
        elevation: 5,
        margin: const EdgeInsets.only(top: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text(
              "Editar Datos",
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D4B)),
            ),
          ),
        ),
      ),
    );
  }
}
