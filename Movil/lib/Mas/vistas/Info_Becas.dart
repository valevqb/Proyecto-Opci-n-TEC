import 'package:flutter/material.dart';
import 'package:opciontec/Mas/controladores/datos_becas.dart';
import 'package:opciontec/Mas/modelos/Becas.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../locators.dart';
import 'package:url_launcher/url_launcher.dart';

class Info_Becas extends StatefulWidget {
  final DataBecas BecaSelec_par;

  Info_Becas(this.BecaSelec_par);

  @override
  _Info_BecasState createState() => _Info_BecasState();
}

class _Info_BecasState extends State<Info_Becas> {
  late DataBecas BecaSelec;

  @override
  void initState() {
    super.initState();
    BecaSelec = this.widget.BecaSelec_par;
    locator<DatosBecas>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String Categoria = BecaSelec.Categoria.toString();
    List<dynamic>? InfoBeneficios = BecaSelec.Beneficios;

    bool isLoading = Provider.of<DatosBecas>(context).isLoading;
    return MaterialApp(
      title: "Pez Info becas",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_circle_left_rounded,
                size: 40.0, color: Colors.lightBlue),
          ),
          title: Text('Beca ' + Categoria,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
        ),
        body: (isLoading)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: width - 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color(0xFFCBEFF7),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        width: (width - 50) / 5,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
              ),
              Center(
                  child: Secciones(
                      texto: BecaSelec.Nombre.toString(),
                      tamano: 20.0,
                      width: width - 25,
                      color: Colors.blue.shade900)),
              Center(
                  child: Secciones(
                      texto: BecaSelec.Descripcion.toString(),
                      tamano: 12.0,
                      width: width - 25,
                      color: Colors.black87)),
              Center(
                  child: Secciones(
                      texto: "Requisitos",
                      tamano: 16.0,
                      width: width - 25,
                      color: Colors.blue.shade900)),
              Center(
                  child: Secciones(
                      texto: BecaSelec.Requisitos.toString(),
                      tamano: 12.0,
                      width: width - 25,
                      color: Colors.black87)),
              Center(
                  child: Secciones(
                      texto: "Beneficios",
                      tamano: 16.0,
                      width: width - 25,
                      color: Colors.blue.shade900)),
              Center(
                  child: Secciones(
                      texto: BecaSelec.Beneficios.toString(),
                      tamano: 12.0,
                      width: width - 25,
                      color: Colors.black87)),
              Center(
                  child: SizedBox(
                    width: width - 40,
                    child: FloatingActionButton.extended(
                      heroTag: UniqueKey(),
                      label: Text('Leer más',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)),
                      // <-- Text
                      backgroundColor: Colors.lightBlue.shade200,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15.0))),
                      icon: const Icon(
                        // <-- Icon
                        Icons.chrome_reader_mode_outlined,
                        size: 24.0,
                      ),
                      onPressed: () {
                        launchUrlString(
                            "https://www.tec.ac.cr/beca-total-mauricio-campos");
                      },
                    ),
                  ))
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
  double width = 50;
  Color color = Colors.blue.shade900;

  Secciones({
    required this.texto,
    required this.tamano,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Text(texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: tamano,
              fontWeight: FontWeight.bold,
              color: color)),
    );
  }
}