import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Express extends StatefulWidget {
  // const Express({Key? key}) : super(key: key);

  @override
  _ExpressState createState() => _ExpressState();
}

class _ExpressState extends State<Express> {
  double lat=9.033140;
  double lng=38.750080;
  Marker _origin ;
  GoogleMapController _googlemapcontroller;
  void _addMarker(LatLng pos){
    print('click is working');
    setState(() {
       _origin =Marker(
        markerId: MarkerId('origin'),
        infoWindow: InfoWindow(title:"Origin"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
        position: pos,

      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      child: GoogleMap(
        initialCameraPosition:CameraPosition(target: LatLng(lat,lng ), zoom: 11.5),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers:{
          if(_origin != null) _origin,
        },
        onTap: _addMarker,
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _googlemapcontroller = controller;
        },

      ),

    );
  }
}
