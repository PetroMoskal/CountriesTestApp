import '../models/item.dart';
import '../widgets/borders_card.dart';
import '../widgets/currencies_card.dart';
import '../widgets/numericCode_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';

import '../widgets/country_map.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item arg = ModalRoute.of(context).settings.arguments;

    bool areLanLnd;
    if (arg.latlng == null || arg.latlng.isEmpty) {
      areLanLnd = false;
    } else
      areLanLnd = true;

    bool areBorders;
    if (arg.borders == null || arg.borders.isEmpty) {
      areBorders = false;
    } else
      areBorders = true;

    bool isCode;
    if (arg.numericCode == null || arg.numericCode.isEmpty) {
      isCode = false;
    } else
      isCode = true;

    bool isCurrencies;
    if (arg.currencies == null || arg.currencies.isEmpty) {
      isCurrencies = false;
    } else
      isCurrencies = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              areLanLnd ? CountryMap(arg.latlng) : Container(),
              isCode ? NumericCodeCard(arg.alpha2Code) : Container(),
              areBorders ? BordersCard(arg.borders) : Container(),
              isCurrencies ? CurrenciesCard(arg.currencies) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
