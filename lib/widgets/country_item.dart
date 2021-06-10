import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../provider/items_provider.dart';

class CountryItem extends StatelessWidget {
  final Item country;
  CountryItem(this.country);

  @override
  Widget build(BuildContext context) {
    bool isFlag;
    if (country.flag == null ||
        country.flag.isEmpty ||
        SvgPicture.network(country.flag) == null) {
      isFlag = false;
    } else
      isFlag = true;

    try {
      SvgPicture.network(country.flag);
    } catch (error) {
      isFlag = false;
    }

    return Card(
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          Provider.of<Countries>(context, listen: false)
              .deleteItem(country.name);
        },
        child: ListTile(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/county_screen', arguments: country);
          },
          leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: isFlag
                  ? SvgPicture.network(
                      country.flag,
                      width: 40,
                      allowDrawingOutsideViewBox: true,
                      placeholderBuilder: (context) =>
                          Icon(Icons.image_not_supported_outlined),
                    )
                  : Icon(Icons.error_rounded)),
          title: Text(country.name),
          subtitle: Text(country.subregion),
          trailing: Text(country.alpha2Code),
        ),
      ),
    );
  }
}
