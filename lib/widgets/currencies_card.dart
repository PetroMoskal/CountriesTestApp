// import 'package:eu_countries/models/item.dart';

import 'package:flutter/material.dart';

class CurrenciesCard extends StatelessWidget {
  final List<dynamic> currencies;
  CurrenciesCard(this.currencies);

  // final List<Currency> currency = [];

  @override
  Widget build(BuildContext context) {
    String code = currencies[0]['code'];
    String name = currencies[0]['name'];
    String symbol = currencies[0]['symbol'];

    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Currency',
              style: TextStyle(fontSize: 12),
            ),
            subtitle: Column(
              children: [
                CurrencyInfo('code:', code),
                CurrencyInfo('name:', name),
                CurrencyInfo('symbol:', symbol),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyInfo extends StatelessWidget {
  final String title;
  final String value;

  CurrencyInfo(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    bool valueIsNull;
    if (value == null) {
      valueIsNull = true;
    } else {
      valueIsNull = false;
    }
    return valueIsNull
        ? Container()
        : Row(
            children: [
              Text(
                title.toString(),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          );
  }
}
