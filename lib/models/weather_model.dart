import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final double lat;
  final double long;
  final String main;
  final String description;
  final int id;
  final String name;

  const WeatherModel({
    required this.lat,
    required this.long,
    required this.main,
    required this.description,
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [lat, long, main, description, id, name];

  WeatherModel copyWith({
    double? lat,
    double? long,
    String? main,
    String? description,
    int? id,
    String? name,
  }) {
    return WeatherModel(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      main: main ?? this.main,
      description: description ?? this.description,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  WeatherModel toEmpty() {
    return const WeatherModel(
      lat: 0,
      long: 0,
      main: 'main',
      description: 'description',
      id: 0,
      name: 'name',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'main': main,
      'description': description,
      'id': id,
      'name': name,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      lat: map['coord']?['lat'] ?? 0,
      long: map['coord']?['long'] ?? 0,
      main: map['weather'][0]?['main'] ?? '',
      description: map['weather'][0]?['description'],
      id: map['weather'][0]?['id'],
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(Map<String, dynamic> map) => WeatherModel(
        lat: map['coord']['lat'],
        long: map['coord']['long'],
        main: map['weather'][0]['main'],
        description: map['weather'][0]['description'],
        id: map['weather'][0]['id'],
        name: map['name'],
      );

  @override
  bool get stringify => true;
}
