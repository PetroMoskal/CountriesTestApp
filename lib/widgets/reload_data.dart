import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items_provider.dart';

class ReloadData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String errorMessage = Provider.of<Countries>(context).errorMessage;
    final Function reloadData =
        Provider.of<Countries>(context, listen: false).reloadData;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {
                reloadData();
              },
              icon: Icon(Icons.replay_outlined),
              label: Text('RETRY')),
        ],
      ),
    );
  }
}
