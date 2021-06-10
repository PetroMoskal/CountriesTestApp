// import 'package:flutter/material.dart';

class Item {
  String name;
  String subregion;
  String alpha2Code;
  String flag;
  List latlng;
  String numericCode; // has one null
  List borders;
  List<dynamic> currencies;

  Item({
    this.name,
    this.subregion,
    this.alpha2Code,
    this.flag,
    this.latlng,
    this.numericCode,
    this.borders,
    this.currencies,
  });
}
