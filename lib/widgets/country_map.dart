import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CountryMap extends StatelessWidget {
  final List mapPossition;
  CountryMap(this.mapPossition);

  @override
  Widget build(BuildContext context) {
    final double lat = mapPossition[0];
    final double lng = mapPossition[1];
    return Card(
      child: Container(
        height: 500,
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(lat, lng),
            zoom: 5,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(lat, lng),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
