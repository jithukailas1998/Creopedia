import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPoly extends StatefulWidget {
  @override
  _MapPolyState createState() => _MapPolyState();
}

class _MapPolyState extends State<MapPoly> {
  
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
              GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: LatLng(9.5916, 76.5222),
          zoom: 14.0,

          ),
          mapType: MapType.normal,
          ),
        ],
      ),
    );
  }
  void onMapCreated(GoogleMapController controller){
    setState(() {
      _controller = controller;
    });
  }
}