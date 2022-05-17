import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Pickuppage extends StatefulWidget {
  const Pickuppage({Key key}) : super(key: key);

  @override
  State<Pickuppage> createState() => _PickuppageState();
}

class _PickuppageState extends State<Pickuppage> {
  bool isloading = false;

  bool arived = false;

  static CameraPosition _intitialCameraPosition =
  CameraPosition(target: LatLng( 8.9769,38.8), zoom: 12.5);

  // ignore: non_constant_identifier_names
  GoogleMapController _googlemapcontroller;
  BitmapDescriptor myIconS;
  BitmapDescriptor markerbitmap;
  Marker _origin;
  Marker _carpostion;
  Marker destination;
  Position _currentPosition;
  Set<Marker> markers = Set();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polylinePoints = PolylinePoints();
    _determinePosition();

    addicons();
  }
  void addicons() async{
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/bike.png",
    );
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/person2.png')
        .then((onValue) {
      myIconS = onValue;
    });
  }
  Future<Position> _determinePosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    _currentPosition=await Geolocator.getCurrentPosition();
    print(_currentPosition);
    setState(() {
      if(_currentPosition != null)
        {
          _carpostion=Marker(
        markerId: MarkerId('Your Location'),
        infoWindow: InfoWindow(title:"Your Location"),
        // icon: BitmapDescriptor.fromAsset("assets/shop_icon3.png",),
        icon:myIconS,
        position: LatLng(_currentPosition.latitude,_currentPosition.longitude),

      );
        setPolylines();
        }
    });
    return _currentPosition ;
  }
  @override
  void dispose() {
    _googlemapcontroller.dispose();
    super.dispose();
  }

  Set<Polyline> _polylines= Set<Polyline>();
  List<LatLng> PolylineCoordinates=[];
  PolylinePoints polylinePoints;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   if (_origin != null)
        //     TextButton(
        //         onPressed: () => _googlemapcontroller.animateCamera(
        //             CameraUpdate.newCameraPosition(CameraPosition(
        //                 target: _origin.position, zoom: 14.5, tilt: 50.0))),
        //         style: TextButton.styleFrom(
        //             primary: Colors.green,
        //             textStyle: TextStyle(fontWeight: FontWeight.w600)),
        //         child: Text('ORIGIN')),
        //   if (_origin != null)
        //     TextButton(
        //         onPressed: () => _googlemapcontroller.animateCamera(
        //             CameraUpdate.newCameraPosition(CameraPosition(
        //                 target: _destination.position,
        //                 zoom: 14.5,
        //                 tilt: 50.0))),
        //         style: TextButton.styleFrom(
        //             primary: Colors.green,
        //             textStyle: TextStyle(fontWeight: FontWeight.w600)),
        //         child: Text('DEST')),
        // ],
        iconTheme: IconThemeData(color: Colors.grey[700]),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "self pickup detail",
          style: TextStyle(color: Colors.grey[700], fontSize: 15),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
              initialCameraPosition: _intitialCameraPosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller){
                _googlemapcontroller=controller;
                setPolylines();
              },
              markers: {
                if (_carpostion != null) _carpostion,
                Marker(
                  markerId: MarkerId('Bola'),
                  infoWindow: InfoWindow(title: "Bola Shop"),
                  // icon: BitmapDescriptor.fromAsset("assets/shop_icon3.png",),
                  icon: BitmapDescriptor.defaultMarker ,
                  position: LatLng(8.9769, 38.8),
                )},
              // onLongPress: _addMarker,
              polylines: _polylines
          ),


        ],
      ),

    );
  }
  void setPolylines() async{
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDd81MpJcxjNdICQeKRg3Emywp4e_29Sfc",
        PointLatLng(
          _currentPosition.latitude, _currentPosition.longitude,
        ),
        PointLatLng(
            8.9769, 38.8
        )
    );
    if(result.status == 'OK'){
      result.points.forEach((PointLatLng point) {
        PolylineCoordinates.add(
            LatLng(point.latitude,point.longitude)
        );
      });
      setState(() {
        _polylines.add(
            Polyline(polylineId: PolylineId('polyline'),
                width: 5,
                color:Colors.green,
                points: PolylineCoordinates
            ));
      });
    }
    print(result.points);
  }

}
