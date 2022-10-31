import 'package:flutter/material.dart';
import 'package:opciontec/Mas/controladores/Datos_Costos.dart';
import 'package:opciontec/Mas/modelos/Costos.dart';
import 'package:provider/provider.dart';
import '../../locators.dart';

const List<String> list = <String>['Bachillerato', 'Licenciatura', 'Maestria'];

class Info_Costos extends StatefulWidget {
  @override
  _Info_CostosState createState() => _Info_CostosState();
}

class _Info_CostosState extends State<Info_Costos> {
  String precio_creditos = '';

  @override
  void initState() {
    super.initState();
    locator<DatosCostos>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<DataCostos>? Costos = Provider.of<DatosCostos>(context).costos;
    bool isLoading = Provider.of<DatosCostos>(context).isLoading;

    void showAlertDialog(BuildContext context) {
      // variables a modificar
      int _creditos = 1;
      int _costos_creditos = 20595;
      int _costos_matricula = 5485;

      // Bottones
      Widget SumaButton = IconButton(
        icon: const Icon(Icons.add_circle_rounded,
            size: 40.0, color: Colors.lightBlue),
        onPressed: () {
          if (_creditos > 0) {
            setState(() {
              _creditos++;
              if (_creditos <= 12) {
                _costos_creditos = _creditos * 20595;
              }
            });
          }
          ;
        },
      );
      Widget RestaButton = IconButton(
        icon: const Icon(Icons.remove_circle,
            size: 40.0, color: Colors.lightBlue),
        onPressed: () {
          if (_creditos > 0) {
            setState(() {
              _creditos--;
              if (_creditos <= 12) {
                _costos_creditos = _creditos * 20595;
              }
            });
          }
          ;
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const DropdownButtonExample(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RestaButton,
                  Text('  ' + '$_creditos' + '  ',
                      style: const TextStyle(fontSize: 24, color: Colors.lightBlue)),
                  SumaButton,
                ],
              ),
              const Text("Créditos ",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              const Text("                 ", style: TextStyle(fontSize: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Créditos                ",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  Text('₡ ' + _costos_creditos.toString(),
                      style:
                          const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text("                 ", style: TextStyle(fontSize: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Matricula                    ",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        //color: Colors.blue.shade900
                      )),
                  Text('₡  ' + _costos_matricula.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        //color: Colors.blue.shade900
                      )),
                ],
              ),
              const Text("                 ", style: TextStyle(fontSize: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text("Bienestar Estudiantil ",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        //color: Colors.blue.shade900
                      )),
                  Text("₡  1915",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        //color: Colors.blue.shade900
                      )),
                ],
              ),
              const Text("----------------------"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Total           ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  Text(
                      '₡' +
                          (_costos_creditos + _costos_matricula + 1915)
                              .toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ],
              ),
            ],
          ));

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return MaterialApp(
      title: "Pez Info Costos",
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
          elevation: 0,
          backgroundColor: Color(0xFFCBEFF7),
        ),
        body: (isLoading)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          color: Color(0xFFCBEFF7),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset('lib/Fotos/CalCostos.png'),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),
                    ),
                    Center(
                        child: Secciones(
                            texto: 'Costos', tamano: 20.0, width: width - 25)),
                    Center(
                        child: Secciones(
                            texto:
                                'El costo de los estudios se calcula sobre el valor semestral del crédito y se ajusta anualmente de acuerdo con la inflación del año anterior. \n\nLos créditos son un valor equivalente a la cantidad de horas de trabajo de cada curso.',
                            tamano: 12.0,
                            width: width - 25)),
                    Center(
                      child: SizedBox(
                        height: 3.8 * height / 8,
                        width: width - 50,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: ListView.builder(
                                itemCount: Costos!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      elevation: 5,
                                      color: Color(
                                          int.parse(Costos[index].Color!)),
                                      child: ListTile(
                                        title: Text(
                                          Costos[index].Nombre! + '\n',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        subtitle: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                "1 Crédito \n                           " +
                                                    Costos[index].Un_Credito! +
                                                    '\n' +
                                                    'Máximo de créditos ' +
                                                    Costos[index].Tope! +
                                                    '\n' +
                                                    'Matricula \n                           ' +
                                                    Costos[index].Matricula! +
                                                    '\n' +
                                                    'Bienestar Estudiantil \n                           ' +
                                                    Costos[index]
                                                        .BienestarEstudiantil! +
                                                    '\n',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                              Center(
                                                child: Container(
                                                  //margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10.0),
                                                      child: Text(
                                                        Costos[index]
                                                                .Descripcion! +
                                                            '\n',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF1C2D4B)),
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                })),
                      ),
                    ),
                    Center(
                        child: SizedBox(
                      width: width - 40,
                      child: FloatingActionButton.extended(
                        heroTag: UniqueKey(),
                        label: Text('Calcular costo total',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900)),
                        // <-- Text
                        backgroundColor: Color(0xFFCBEFF7),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        icon: const Icon(
                          // <-- Icon
                          Icons.monetization_on_outlined,
                          size: 24.0,
                        ),
                        onPressed: () {
                          showAlertDialog(context);
                          print("pez calc");
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

  Secciones({
    required this.texto,
    required this.tamano,
    required this.width,
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
              color: const Color(0xFF1C2D4B))),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward, color: Colors.blue),
      elevation: 16,
      isExpanded: true,
      style: const TextStyle(color: Color(0xFF1C2D4B)),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
