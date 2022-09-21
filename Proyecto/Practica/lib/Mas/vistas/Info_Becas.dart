import 'package:flutter/material.dart';
import 'package:untitled/Mas/controladores/datos_costos.dart';
import 'package:untitled/Mas/modelos/Costos.dart';
import 'package:provider/provider.dart';
import '../../locators.dart';

class Info_Becas extends StatefulWidget {
  @override
  _Info_BecasState createState() => _Info_BecasState();
}

class _Info_BecasState extends State<Info_Becas> {
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
          title: Text('Beca socieconomica Pez .....',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
        ),
        body: (isLoading)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Container(
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
                        ],
                      ),
                    ),*/
              Center(
                child: Container(
                  width: width-50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    children: <Widget>[
                      new Image.network(
                        'https://picsum.photos/250?image=9',
                        width: (width-50)/5 ,
                      ),
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
                  height: 4.2*height / 8,
                  width: width - 50,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ListView.builder(
                          itemCount: Costos!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                elevation: 5,
                                color: new Color(
                                    int.parse(Costos[index].Color!)),
                                child: ListTile(
                                  //selectedColor: Colors.deepOrange,
                                  //selectedColorolor: Costos[index].Color!,
                                  title: Text(
                                    //" Pez costos",
                                    Costos[index].Nombre! + '\n',
                                    style: TextStyle(
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
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Center(
                                          child: Container(
                                            //margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      10)),
                                            ),
                                            child: Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 10.0,right: 10.0),
                                                child: Text(
                                                  //" Pez costos",
                                                  Costos[index]
                                                      .Descripcion! +
                                                      '\n',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Colors.black87),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: EdgeInsets.all(20),
      child: Text(this.texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: this.tamano,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900)),
    );
  }
}
