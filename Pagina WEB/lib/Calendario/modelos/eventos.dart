import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Eventos extends CalendarDataSource{
  List<List<DataEventos>>? datos;
  int? total;


  Eventos(List<DataEventos> source) {
    appointments = source;
  }
  Eventos.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];

    List<DataEventos> Matricula = [];
    List<DataEventos> admision = [];
    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        if(v['info']['Categoria']=="Matricula"){
          Matricula.add(new DataEventos.fromJson(v));
        }else {
          admision.add(new DataEventos.fromJson(v));
        }
      });
    }

  }
  MeetingDataSource(List<DataEventos> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).inicio;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).fin;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).nombre;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).fondo;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).estododia;
  }
  DataEventos _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final DataEventos meetingData;
    if (meeting is DataEventos) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class DataEventos {
  late int id;
  late String nombre;
  late DateTime inicio;
  late DateTime fin;
  late Color fondo;
  late bool estododia;

  DataEventos(
       this.nombre, this.inicio,  this.fin,  this.fondo,  this.estododia);

  DataEventos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    inicio = json['info']['inicio'];
    fin = json['info']['fin'];
    fondo = json['info']['fondo'];
    estododia = json['info']['estododia'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nombre'] = nombre;
    data['inicio'] = inicio;
    data['fin'] = fin;
    data['fondo'] = fondo;
    data['estododia'] = estododia;
    return data;
  }
}




