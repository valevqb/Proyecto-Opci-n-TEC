import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Eventos extends CalendarDataSource {
  List<DataEventos>? datos;
  int? total;

  Eventos(List<DataEventos>? source) {
    appointments = source;
  }
  Eventos.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];

    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(DataEventos.fromJson(v));
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
  late String descripcion;

  DataEventos(this.nombre, this.inicio, this.fin, this.fondo, this.estododia);

  DataEventos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    inicio = DateTime.parse(json['fechainicio']);
    fin = DateTime.parse(json['fechafin']);
    fondo = const Color(0xFF0F8644);
    estododia = json['estododia'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['fechainicio'] = inicio;
    data['fechafin'] = fin;
    data['fondo'] = fondo;
    data['estododia'] = estododia;
    data['descripcion'] = descripcion;
    return data;
  }
}
