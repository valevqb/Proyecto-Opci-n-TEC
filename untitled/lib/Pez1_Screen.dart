import 'package:flutter/material.dart';

/*Plantilla */
class Plantilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pez Prueba",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pez pantalla "),
        ),
        body: Center(
            child: Container(
          //color: Color.fromARGB(255, 164, 219, 241),
          margin: EdgeInsets.all(30),
          //width: 200,
          //height: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 164, 219, 241),
              border: Border.all(
                color: Colors.greenAccent,
                //style: BorderStyle.solid,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(300)),
          child: Text(
            "Pez ",
            /*style: TextStyle(
                  fontSize: 15,*/
          ),
          padding: EdgeInsets.all(20),
        )),
      ),
      //),
    );
  }
}

class Plantilla2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pez Prueba",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pez pantalla 2"),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 164, 219, 241),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    //SOMBRA
                    color: Colors.lightBlue,
                    offset: Offset(6, 6),
                    blurRadius: 4,
                  ),
                ]),
            child: Text("Pez vol"),
            padding: EdgeInsets.all(20),
            //modifica el cuadro
            //constraints:BoxConstraints(

            // )
          ),
        ),
      ), //),
    );
  }
}

class PezText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
          child: SizedBox(
        width: 250,
        height: 200,
        child: Text(
          "Pez texto " * 10,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            backgroundColor: Colors.brown,
          ),
        ),
      )),
    );
  }
}

class PezPading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}

class PezColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            children: [
              Text("Pez 1"),
              Text("Pez 2"),
              Container(
                height: 50,
                width: 50,
                color: Colors.cyan,
              ),
              Text(
                "Pez final",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.end,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.yellow,
              )
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
