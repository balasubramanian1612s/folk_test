import 'package:flutter/material.dart';

class Room {
  String name;
  int numberOfLights;
  String svgPath;
  Room(
    @required this.name,
    @required this.numberOfLights,
    @required this.svgPath,
  );
}
