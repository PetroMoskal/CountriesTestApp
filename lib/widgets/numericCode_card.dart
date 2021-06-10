import 'package:flutter/material.dart';

class NumericCodeCard extends StatelessWidget {
  final String code;
  NumericCodeCard(this.code);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Numeric code',
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Text(
          code,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
