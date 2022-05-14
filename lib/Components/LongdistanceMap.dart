import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Longdistancemap extends StatefulWidget {

  @override
  _LongdistancemapState createState() => _LongdistancemapState();
}

class _LongdistancemapState extends State<Longdistancemap> {
  GoogleMapController _googlemapcontrollerforlongD;
  Future <void> _gotosearch(Map<String,dynamic> place) async{
    print(place);
    final double lat=place['geometry']['location']['lat'];
    final double lng=place['geometry']['location']['lng'];
    _googlemapcontrollerforlongD.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target:LatLng(lat,lng),
            zoom:40
        )
    ));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GoogleMap(
        initialCameraPosition:CameraPosition(target: LatLng(9.033140,38.750080), zoom: 11.5),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        markers:{

        },
        onMapCreated: (controller) {
          _googlemapcontrollerforlongD = controller;
        },
      ),
    );
  }
}
