import 'package:flutter/material.dart';

class BordersCard extends StatelessWidget {
  final List borders;
  BordersCard(this.borders);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Country borders',
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Row(
          children: borders
              .map((e) => Row(
                    children: [
                      Text(
                        e,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 3,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
