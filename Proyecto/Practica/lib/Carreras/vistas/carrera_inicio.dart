import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Carreras/modelos/Carrera.dart';
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
                icon: Icon(Icons.account_circle_sharp,
                    size: 40.0, color: Colors.lightBlue),
              )
            ],
          ),
          body: (isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                    Secciones(texto: ' ', tamano: 14.0),
                    Positioned(
                      bottom: 0,
                      left:0,
                      right: 0,
                      child: Busqueda(texto: 'nombre de la carreras', tamano: 14.0, width: width),),
                    Secciones(texto: 'Carreras', tamano: 14.0),
                    SizedBox(
                        height: height - 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              itemCount: users!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: EdgeInsets.all(15),
                                  elevation: 10,
                                  child: ListTile(
                                    leading: ConstrainedBox(
                                      constraints: BoxConstraints(
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
                                            text: users[index].Horario!,
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              backgroundColor:
                                                  Colors.orangeAccent.shade100,
                                              color:
                                                  Colors.orangeAccent.shade700,
                                            )),
                                        TextSpan(text: ' \n '),
                                        TextSpan(
                                          text: users[index].Nombre!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    )),
                                    subtitle: Text(
                                      users[index].Descripcion!,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                    trailing: Text(
                                        'ID: ' + users[index].id.toString()),
                                  ),
   /* child: new InkWell(
    onTap: () {
    if(servicio.firstName != "Eve"){ //validacion de si son buses o no
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => InformacionServicio()),
    );
    }}),*/
                                );
                              }),
                        )),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
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
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          style: TextStyle(
              fontSize: this.tamano,
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
        padding: EdgeInsets.all(20),
        margin: new EdgeInsets.symmetric(horizontal: width/15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
            ),
          ],
        ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: this.texto,
          hintStyle: TextStyle(
              fontSize: this.tamano,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: Icon(Icons.search_rounded,
                      size: 24.0, color: Colors.lightBlue)),
        ),
        );
  }
}
