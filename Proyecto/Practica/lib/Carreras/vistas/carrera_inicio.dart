import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Carreras/modelos/Carrera.dart';
import 'package:untitled/Carreras/vistas/Info_Carreras.dart';
import 'package:untitled/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioCarrera extends StatefulWidget {
  @override
  _InicioCarreraState createState() => _InicioCarreraState();
}

class _InicioCarreraState extends State<InicioCarrera> {
  @override
  void initState() {
    super.initState();
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DataCarrera>? users = Provider.of<DatosCarrera>(context).carreras;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    return MaterialApp(
        title: "Pez carreras",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Conocé las carreras',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900)),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_sharp,
                    size: 40.0, color: Colors.lightBlue),
              )
            ],
          ),
          body: (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Secciones(texto: ' ', tamano: 14.0),
                    Positioned(
                      bottom: 0,
                      left:0,
                      right: 0,
                      child: Busqueda(texto: 'nombre de la carreras', tamano: 14.0, width: width),),
                    SizedBox(
                        height: height - 50,
                        child: Container(
                          margin: const EdgeInsets.only(left: 24, right: 24, top: 32),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: users!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: const EdgeInsets.all(15),
                                  elevation: 10,
                                  child: InkWell(
                                  onTap: () {//validacion de si son buses o no
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InformacionCarrera(users[index])),
                                      );
                                  },
                                  child: ListTile(
                                    leading: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 104,
                                        maxHeight: 104,
                                      ),
                                      child: Image.network(
                                        users[index].IMG!,
                                        isAntiAlias: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    //leading: Image.network(users[index].IMG!),
                                    title: Text.rich(TextSpan(
                                      text: ' ', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: users[index].Categoria!,
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              backgroundColor:
                                                  const Color(0xFF388E9F).withOpacity(0.5),
                                              color:
                                                  const Color(0xFF388E9F),
                                            )),
                                        const TextSpan(text: ' \n '),
                                        TextSpan(
                                          text: users[index].Nombre!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    )),
                                    subtitle: Text(
                                      users[index].Resumen!,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                  ),
                                ),
                                );
                              }),
                        )),
                  ],
                )),
        ));
  }
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;

  Secciones({
    required this.texto,
    required this.tamano,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(texto,
          style: TextStyle(
              fontSize: tamano,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900)),
    );
  }
}

class Busqueda extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  double width = 50;

  Busqueda({
    required this.texto,
    required this.tamano,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        width: width-25,
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: width/15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
            ),
          ],
        ),
      child: Align(
        //alignment: Alignment.center,
        child: TextField(
          //textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {},
          decoration: InputDecoration(
            //isCollapsed: true,
            hintText: texto,
            hintStyle: TextStyle(
                fontSize: tamano,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: const Icon(Icons.search_rounded,
                        size: 24.0, color: Colors.lightBlue)),
          ),
        )
        );
  }
}
