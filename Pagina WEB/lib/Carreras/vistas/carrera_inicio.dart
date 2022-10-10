
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opciontec/Carreras/modelos/Carrera.dart';
import 'package:opciontec/Carreras/vistas/Info_Carreras.dart';
import 'package:opciontec/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioCarrera extends StatefulWidget {
  @override
  _InicioCarreraState createState() => _InicioCarreraState();
}

class _InicioCarreraState extends State<InicioCarrera> {
  List<DataCarrera>? busquedaActiva;
  List<DataCarrera>? users;
  var firstime = 0;
  var textoFinal;
  final controller = TextEditingController();

  @override
  void initState() {
    textoFinal = "Nombre de la carrera";
    super.initState();
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    users = Provider.of<DatosCarrera>(context).carreras;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    if(firstime == 0){
      busquedaActiva = users;
    }
    firstime = 1;

    return MaterialApp(
        title: "Carreras",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Conocé las carreras',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2D4B))),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_sharp, size: 40.0, color : Color(0xBE5CC6DE)),
              ),
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
                      child: Container(
                          height: 42,
                          width: width-25,
                          padding: const EdgeInsets.only(left: 20),
                          margin: EdgeInsets.symmetric(horizontal: width/15),
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
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: buscarCarrera,
                              decoration: InputDecoration(
                                //isCollapsed: true,
                                  hintText: textoFinal,
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5)),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: const Icon(Icons.search_rounded,
                                      size: 20.0, color: Color(0xBE5CC6DE))
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                        height: height - 50,
                        child: Container(
                          margin: const EdgeInsets.only(left: 24, right: 24, top: 32),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                          ),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: busquedaActiva!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: const EdgeInsets.all(15),
                                  elevation: 10,
                                  child: InkWell(
                                  onTap: () {//validacion carrera
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InformacionCarrera(busquedaActiva![index])),
                                      );
                                  },
                                  child: ListTile(
                                    leading: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 104,
                                        maxHeight: 104,
                                      ),
                                      child: Image.network(
                                        busquedaActiva![index].IMG!,
                                        isAntiAlias: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    //leading: Image.network(users[index].IMG!),
                                    title: Text.rich(TextSpan(
                                      text: ' ', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: busquedaActiva![index].Categoria!,
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              backgroundColor:
                                                  const Color(0xFF388E9F).withOpacity(0.5),
                                              color:
                                                  const Color(0xFF388E9F),
                                            )),
                                        const TextSpan(text: ' \n '),
                                        TextSpan(
                                          text: busquedaActiva![index].Nombre!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1C2D4B)),
                                        ),
                                      ],
                                    )),
                                    subtitle: Text(
                                      busquedaActiva![index].Resumen!,
                                      style: const TextStyle(
                                          fontSize: 16, color: Color(0xFF1C2D4B)),
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

  void buscarCarrera(String carreraE){
    var sugerencias = users?.where((element) {
      var sugerencia = element.Nombre?.toString().toLowerCase();
      var escrito = carreraE.toString().toLowerCase();
      return sugerencia!.contains(escrito);
    }).toList();

    setState(() {
      busquedaActiva = sugerencias;
    });
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
