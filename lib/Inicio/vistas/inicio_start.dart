import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:opciontec/Carreras/vistas/Info_Carreras.dart';
import 'package:opciontec/Admision/vistas/Admision_inicio.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<DataCarrera>? busquedaActiva;
  var textoFinal;
  final controller = TextEditingController();

  @override
  void initState() {
    textoFinal = "Carrera, becas, servicios, etc.";
    super.initState();
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DataCarrera>? users = Provider.of<DatosCarrera>(context).carreras;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    busquedaActiva = users;

    return MaterialApp(
        title: "Inicio",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF1C2D4B),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle_sharp,
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: width,
                              //height: 190,
                              decoration: BoxDecoration(
                                color: Color(0xFF1C2D4B),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      /*Container(
                                        width: 25,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1C2D4B),
                                        ),
                                      ),*/
                                      Container(
                                        width: width /2,
                                        padding: EdgeInsets.all(20),
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1C2D4B),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('El futuro es',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                                Row(

                                                  children: <Widget>[
                                                    Text('con ',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
                                                    Text('vos',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xBE5CC6DE))),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            Text(
                                                '¡Explorá las carreras \nque el TEC te ofrece \ny encontrá la tuya!',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            Row(

                                              children: <Widget>[
                                                Text('Ver carreras',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFFCBEFF7))),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                      Icons
                                                          .arrow_circle_right_rounded,
                                                      size: 40.0,
                                                      color: Color(0xFFCBEFF7)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(width :(width/2)-50 , 'lib/Fotos/Inicio1.png'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Secciones(
                                texto: ' ',
                                tamano: 14.0,
                                color: Colors.transparent),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  height: 42,
                                  width: width - 25,
                                  padding: const EdgeInsets.only(left: 20),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width / 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0xFFDCDCDC),
                                      //style: BorderStyle.solid,
                                      width: 1,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: controller,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onChanged: buscarCarrera,
                                      decoration: InputDecoration(
                                          //isCollapsed: true,
                                          hintText: textoFinal,
                                          hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          prefixIcon: const Icon(
                                              Icons.search_rounded,
                                              size: 20.0,
                                              color: Color(0xBE5CC6DE))),
                                    ),
                                  )),
                            ),
                            Secciones(
                                texto: ' ',
                                tamano: 14.0,
                                color: Colors.transparent),
                            Center(
                              child: Container(
                                width: width - 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                  color: Color(0xFFCBEFF7),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset(width :(width/2)-50 ,'lib/Fotos/Start.png'),
                                    Container(
                                      width: 3 * (width - 80) / 5,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[

                                          Text('¿Harás el examen de admisión?',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1C2D4B))),
                                          Text(
                                              'Lee los pasos que debes seguir para inscribirte',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1C2D4B))),
                                          new IconButton(
                                            icon: const Icon(
                                                Icons
                                                    .arrow_circle_right_rounded,
                                                size: 40.0,
                                                color: Colors.lightBlueAccent),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    InicioAdmision(),
                                              ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],

                                  mainAxisSize: MainAxisSize.max,
                                ),
                              ),
                            ),
                            Secciones(
                                texto: 'Próximos eventos',
                                tamano: 24.0,
                                color: Color(0xFF1C2D4B)),
                            Secciones(
                                texto: ' ',
                                tamano: 14.0,
                                color: Colors.transparent),
                            Center(
                              child: Container(
                                height: 80,
                                width: width - 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                  color: Colors.indigo.shade50,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 3 * (width - 50) / 5,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Calendario',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1C2D4B))),
                                          Text(
                                              'Mira el resto de fechas importantes que debes tomar en cuenta',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1C2D4B))),
                                        ],
                                      ),
                                    ),
                                    new IconButton(
                                      icon: const Icon(
                                          Icons.arrow_circle_right_rounded,
                                          size: 40.0,
                                          color: Color(0xBE3154E5)),
                                      onPressed: () {
                                        /*
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Calendario(),
                              ));*/
                                      },
                                    ),
                                  ],


                                ),
                              ),
                            ),
                          ],
                        )),
                  )));
  }

  void buscarCarrera(String carreraE) {
    var sugerencias = busquedaActiva?.where((element) {
      var sugerencia = element.Nombre?.toLowerCase();
      var escrito = carreraE.toLowerCase();

      print("object");
      print(escrito.toString());
      print(sugerencia.toString());
      //print("Tiene sugerencias");
      //print(escrito);
      //print(sugerencia.toString());

      return sugerencia!.contains(escrito);
    }).toList();

    setState(() {
      busquedaActiva = sugerencias;
      print("Cambia");
      print(busquedaActiva![0].Nombre.toString());
    });
  }
}

class Secciones extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  Color color = Color(0xFF1C2D4B);

  Secciones({
    required this.texto,
    required this.tamano,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          style: TextStyle(
              fontSize: this.tamano,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C2D4B))),
    );
  }
}

class Busqueda extends StatelessWidget {
  final String texto;
  var tamano = 24.0;
  double width = 50;
  final controller = TextEditingController();

  Busqueda({
    required this.texto,
    required this.tamano,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        width: width - 25,
        padding: const EdgeInsets.only(left: 20, bottom: 15),
        margin: EdgeInsets.symmetric(horizontal: width / 15),
        decoration: BoxDecoration(
          color: Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          //alignment: Alignment.center,
          child: TextField(
            controller: controller,
            //textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                //isCollapsed: true,
                hintText: texto,
                hintStyle: TextStyle(
                    fontSize: tamano,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search_rounded,
                    size: 40.0, color: Colors.lightBlue)),
            //onChanged: buscarCarrera,
          ),
        ));
  }
}
