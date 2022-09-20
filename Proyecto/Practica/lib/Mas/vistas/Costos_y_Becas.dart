import 'package:flutter/material.dart';
import 'package:untitled/Mas/modelos/Costos.dart';
import 'package:untitled/Mas/modelos/Becas.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Mas/controladores/datos_becas.dart';
import 'package:untitled/Mas/vistas/Info_Costos.dart';
import '../../locators.dart';

class Costos_y_Becas extends StatefulWidget {
  @override
  _Costos_y_BecasState createState() => _Costos_y_BecasState();
}

class _Costos_y_BecasState extends State<Costos_y_Becas> {
  @override
  void initState() {
    super.initState();
    locator<DatosBecas>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<List<DataBecas>>? Becas = Provider.of<DatosBecas>(context).becas;
    bool isLoading = Provider.of<DatosBecas>(context).isLoading;
    return MaterialApp(
      title: "Pez Prueba",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {Navigator.of(context).pop();},
            icon: const Icon(Icons.arrow_circle_left_rounded, size: 40.0, color: Colors.lightBlue),
          ),

          title: Text('Costos y becas',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: (isLoading)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(''),
                    Center(
                      child: Container(
                        width: width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Colors.cyan.shade100,
                        ),
                        child: Row(
                          children: <Widget>[
                            new Image.network(
                              'https://picsum.photos/250?image=9',
                              width: (width - 50) / 5,
                            ),
                            Container(
                              width: 3*(width - 50)/ 5,
                              child: Column(
                                children: <Widget>[
                                  Text('¿Sabes cuánto cuestan los cursos?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87)),
                                  Text('Averigua el costo del curso que desees',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                            new IconButton(
                              icon: const Icon(Icons.arrow_circle_right_rounded,
                                  size: 40.0, color: Colors.lightBlue),
                              onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Info_Costos(),
                                  ));
                              },
                            ),

                            /*FloatingActionButton.extended(
                              label: Text(''),
                              //backgroundColor: Colors.lightBlue,
                              */ /*shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),*/ /*
                              icon: Icon(
                                // <-- Icon
                                Icons.arrow_circle_right_rounded,
                                size: 24.0,
                              ),
                              onPressed: () {},
                            ),*/
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),
                    ),
                    Secciones(texto: 'Becas socioeconomicas', tamano: 20.0),
                    SizedBox(
                        height: height/3,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: Becas?[0].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      Becas![0][index].Nombre!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_circle_right_rounded,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                );
                              })),
                    ),
                    Secciones(texto: 'Becas de estimulo', tamano: 20.0),
                    SizedBox(
                      height: height/3,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: Becas?[1].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      Becas![1][index].Nombre!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_circle_right_rounded,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                );
                              })),
                    ),
                  ],
                ),
              ),
      ),
    );
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
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          style: TextStyle(
              fontSize: this.tamano,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900)),
    );
  }
}
