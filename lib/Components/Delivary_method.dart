import 'package:ecommerce/Components/ExpressMap.dart';
import 'package:ecommerce/Components/location_service.dart';
import 'package:ecommerce/Delivary_checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class Delivary_Method extends StatefulWidget {
  const Delivary_Method({Key key}) : super(key: key);

  @override
  State<Delivary_Method> createState() => _Delivary_MethodState();
}

class _Delivary_MethodState extends State<Delivary_Method> {
  bool _switchValue = false;

  bool datedisplay = false;

  bool _Forother = false;

  bool _ExpressSwitch = false;

  bool _SelfPickupSwitch = false;
  bool _LongdistanceSwitch = false;

  bool _OthersSwitch = false;

  bool _Select_date = false;

  var _TimeArray = [
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
  ];

  var _countryArray = [
    "Bola shop",
    "Meskel flower shop",
    // "Hawasa",
    // "Arba minch",
    // "Dire dewa",
    // "Bahirdar",
  ];
  String _currentSelectedValueTime;
  String _currentSelectedValueCountry;
TextEditingController _longDsearchControler=TextEditingController();
  bool _Express = true;
  int mapid=0;
  bool _longdistance = false;
  String date = "";
  DateTime selectedDate = DateTime.now();
  double lat=9.033140;
  double lng=38.750080;

  bool _selfpickup = false;
  // static CameraPosition _intitialCameraPosition =
  //     CameraPosition(target: LatLng(lat,lng ), zoom: 11.5);

  // ignore: non_constant_identifier_names
  GoogleMapController _googlemapcontroller;
  GoogleMapController _googlemapcontrollerforlongD;
  Marker _origin ;
  Marker _destination;

  Future <void> _gotosearch(Map<String,dynamic> place) async{
    print(place);
    final double lat=place['geometry']['location']['lat'];
    final double lng=place['geometry']['location']['lng'];
    _googlemapcontroller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target:LatLng(lat,lng),
            zoom:20
        )
    ));

  }
  Future <void> _goto(double x,double y) async{
    _googlemapcontroller.animateCamera(
        CameraUpdate.newCameraPosition(
           CameraPosition(
               target:LatLng(x,y),
           zoom: 18
           )
    ));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Text("Delivary method",
            style: TextStyle(color: Colors.grey[700], fontSize: 17)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              //   _Myself();

                              _ExpressSwitch == false
                                  ? _Myself()
                                  : _Myself_summary();
                              mapid=0;
                              _selfpickup = false;
                              _longdistance = false;
                              _Express = true;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.transparent,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _Express == false
                                    ? Colors.grey[200]
                                    : Color.fromRGBO(71, 195, 144, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.motorcycle,
                                        color: _Express == false
                                            ? Color.fromRGBO(71, 195, 144, 1)
                                            : Colors.white,
                                      ),
                                      Text(
                                        "Express",
                                        style: TextStyle(
                                            color: _Express == false
                                                ? Color.fromRGBO(
                                                    71, 195, 144, 1)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              // _SelfPickupSwitch == false
                              //     ? _selfpickups()
                              //     : _Selfpickup_summary();
                              mapid=1;
                              _selfpickup = true;
                              _longdistance = false;
                              _Express = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.transparent,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _selfpickup == false
                                    ? Colors.grey[200]
                                    : Color.fromRGBO(71, 195, 144, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.people,
                                        color: _selfpickup == false
                                            ? Color.fromRGBO(71, 195, 144, 1)
                                            : Colors.white,
                                      ),
                                      Text(
                                        "Self Pickup",
                                        style: TextStyle(
                                            color: _selfpickup == false
                                                ? Color.fromRGBO(
                                                    71, 195, 144, 1)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              setState(() {
                                // _LongdistanceSwitch == false;
                                // ? _Longdistance()
                                // : _LongDiostance_summary();
                                mapid=2;
                                _selfpickup = false;
                                _longdistance = true;
                                _Express = false;
                              });
                            });
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 5,
                            child: Container(
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _longdistance == false
                                    ? Colors.grey[100]
                                    : Color.fromRGBO(71, 195, 144, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.car_rental,
                                        color: _longdistance == false
                                            ? Color.fromRGBO(71, 195, 144, 1)
                                            : Colors.white,
                                      ),
                                      Text(
                                        "Long distance",
                                        style: TextStyle(
                                            color: _longdistance == false
                                                ? Color.fromRGBO(
                                                    71, 195, 144, 1)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                child:_selfpickup?
                Container(
                  height: 250,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(target: LatLng(9.033140,38.750080 ), zoom: 11.5),
                    myLocationButtonEnabled:true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    markers: {
                      Marker(
                        markerId: MarkerId('Mekel'),
                        infoWindow: InfoWindow(title:"Meskel flower shop"),
                        icon: BitmapDescriptor.fromAsset("assets/shop_icon3.png",),
                        // BitmapDescriptor.defaultMarkerWithHue(
                        //   BitmapDescriptor.hueGreen,
                        // ),
                        position: LatLng( 8.9933,38.7084),

                      ),
                      Marker(
                        markerId: MarkerId('Bola'),
                        infoWindow: InfoWindow(title:"Bola Shop"),
                        icon: BitmapDescriptor.fromAsset("assets/shop_icon3.png",),
                        // icon: BitmapDescriptor.defaultMarkerWithHue(
                        //   BitmapDescriptor.hueGreen,
                        // ),
                        position: LatLng( 8.9769,38.8),

                      )
                    },
                    onMapCreated: (controller) {
                      _googlemapcontroller = controller;
                    },
                  ),
                ):
                _longdistance?
                Container(
                  height: 250,
                  child: GoogleMap(
                    initialCameraPosition:CameraPosition(target: LatLng(9.033140,38.750080), zoom: 11.5),
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: true,
                    markers:{

                    },
                    onMapCreated: (controller) {
                      _googlemapcontroller = controller;
                    },
                  ),
                ):   _Express?Express():Container(),
              ),

              Display()
            ],
          ),
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: InkWell(
      //     // onTap: () => Navigator.push<MaterialPageRoute>(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (BuildContext context) => Billing(),
      //     //     )),
      //     child: Container(
      //       height: 50,
      //       width: 200,
      //       decoration: BoxDecoration(
      //           border: Border.all(
      //             color: Colors.grey[100],
      //           ),
      //           color: Colors.grey,
      //           borderRadius: BorderRadius.all(Radius.circular(18))),
      //       child: Center(
      //         child: Text(
      //           "Confirm",
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //               fontSize: 18),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  // ignore: unused_element

  Widget Display() {
    if (_Express == true) {
      if (_ExpressSwitch == true) {
        return _Myself_summary();
      }
      if (_OthersSwitch == true) {
        if (_OthersSwitch == false) {
          return _Myself();
        }
        return _forother();
      }
      return _Myself();
    }

    if (_selfpickup == true) {
      if (_SelfPickupSwitch == true) {
        return _Selfpickup_summary();
      }
      return _selfpickups();
    }

    if (_longdistance == true) {
      if (_LongdistanceSwitch == true) {
        return _LongDiostance_summary();
      }
      return _Longdistance();
    }
    return Container(
      height: 20,
      color: Colors.red,
    );
  }

  Widget _Myself() {
    return Container(
      color: Colors.grey[200],
      child: Container(
          padding: MediaQuery.of(context).viewInsets,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: 5,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(18),
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'My Self',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(71, 195, 144, 1),
                              ),
                              height: 5,
                              width: 60,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              //  Navigator.pop(context);
                              _OthersSwitch = true;
                              if (_OthersSwitch == true) {
                                _forother();
                              }
                            });
                          },
                          child: Text("For Others",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey)),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text("Drop-off",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: '    My current location',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.pop(context);
                        _ExpressSwitch = true;

                        //_ExpressSwitch == false ? _Myself() : _Myself_summary();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 150, 20, 0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(71, 195, 144, 1)),
                            color: Color.fromRGBO(71, 195, 144, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  // my self summary
  Widget _Myself_summary() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Yeka 11/12 A.A",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivary Method',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Express My Location",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Teff",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "100kg",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "5500 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vat(15%)',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "885 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivary Fee',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "200 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "6235 birr",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Delivary(),
                    )),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _forother() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),r
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _OthersSwitch = false;
                            });
                          },
                          child: Text('My Self',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("For Others",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey[900])),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                child: Row(
                  children: [
                    Text("Drop-off",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    My current location',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Row(
                  children: [
                    Text("Recipient Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[900])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    Abebe',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: Row(
                  children: [
                    Text("Recipient Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[900])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    09119191919',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => {_Forother_summary()},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // my self summary
  Widget _Forother_summary() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Yeka 11/12 A.A",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivary Method',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Express To Other",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Teff",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "100kg",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "5500 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vat(15%)',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "885 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivary Fee',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "200 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "6235 birr",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Delivary(),
                    )),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _selfpickups() {
    _selectDate(BuildContext context) async {
      final DateTime selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
      );
      if (selected != null && selected != selectedDate)
        setState(() {
          datedisplay = true;
          selectedDate = selected;
        });
    }

    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Set Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              // SfCalendar(
              //   view: CalendarView.timelineDay,
              //   timeSlotViewSettings: TimeSlotViewSettings(
              //       startHour: 9,
              //       endHour: 16,
              //       nonWorkingDays: <int>[
              //         DateTime.friday,
              //         DateTime.saturday
              //       ]),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Row(
                  children: [
                    Text("Choose Site",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[900])),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_Select_date == false)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);

                        },
                        child: Card(
                            color: Colors.transparent,
                            elevation: 5,
                            child: Container(
                              child: Center(
                                  child: datedisplay == false
                                      ? Text(
                                          "Select date",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text('$selectedDate')),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              height: 62,
                              width: 170,
                            )),
                      ),
                    )
                  else Container(),
                    // Date_Selector(),
                  SizedBox(width: 10),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              color: Colors.transparent,
                              elevation: 5,
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    children: [
                                      DropdownButton<String>(
                                        elevation: 20,
                                        icon: SizedBox.shrink(),
                                        // icon: Icon(
                                        //     Icons.arrow_drop_down_circle_sharp),
                                        hint: Center(
                                          child: Text('    Select Time',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),

                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
                                        value: _currentSelectedValueTime,
                                        isDense: true,
                                        onChanged: (String newValue) {

                                          setState(() {

                                            _currentSelectedValueTime =
                                                newValue;
                                            state.didChange(newValue);

                                          });

                                        },
                                        items: _TimeArray.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            )),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      isEmpty: _currentSelectedValueCountry == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            'Select Site',
                            style: TextStyle(),
                          ),
                          value: _currentSelectedValueCountry,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                               // print(newValu);
                              _currentSelectedValueCountry = newValue;
                              state.didChange(newValue);
                            });
                            if(newValue == "Meskel flower shop"){
                              setState(() {
                                print("works");
                                _goto(8.9933,38.7084);

                              });

                            }else if(newValue == "Bola shop"){
                              setState(() {
                                _goto(8.9769,38.8);
                              });

                            }
                          },
                          items: _countryArray.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 140,
              ),
              InkWell(
                onTap: () => {
                  setState(() {
                    //     Navigator.pop(context),
                    _SelfPickupSwitch = true;
                  })
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Selfpickup_summary() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(18.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Yeka 11/12 A.A",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Teff",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "100kg",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "5500 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vat(15%)',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "885 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivary Fee',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "200 birr",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "6235 birr",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Delivary(),
                    )),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _Longdistance() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Choose a Place",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey[900])),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 120,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Row(
                  children: [
                    Text("Drop-off",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: _longDsearchControler,
                  onChanged: (value){
                    print(value);
                  },
                  decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.red,
                    ),
                    suffixIcon:IconButton(
                      onPressed: () async{
                        var place = await LocationService().getPlace(_longDsearchControler.text);
                        _gotosearch(place);
                      },
                     icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.red,
                      ),
                    ) ,

                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    My current location',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    Text("Recipient Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[900])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    Abebe',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: Row(
                  children: [
                    Text("Recipient Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[900])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '    09119191919',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _LongdistanceSwitch = true;
                  });
                  // Navigator.pop(context),

                  // _LongdistanceSwitch == false
                  //     ? _Longdistance()
                  //     : _LongDiostance_summary(),
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _LongDiostance_summary() {
    return Container(
      color: Colors.grey[200],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(18.0),
              //     child: Container(
              //       height: 5,
              //       width: 100,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(71, 195, 144, 1),
                          ),
                          height: 5,
                          width: 80,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pickup Detail',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Site Location',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Bahr dar",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Confirmation Code Sent!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            'We have sent unique confirmation code to the recipient’s phone number.',
                            style: TextStyle(color: Colors.grey)),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '555-556',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        Text(
                            'Please notify the recipient to enter the above code on the driver’s application upon delivery',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Delivary())),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(71, 195, 144, 1)),
                      color: Color.fromRGBO(71, 195, 144, 1),
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Date_Selector() {
  //   return SizedBox(
  //     height: 250,
  //     width: 300,
  //     child: TableCalendar<void>(
  //       shouldFillViewport: true,
  //       firstDay: DateTime.utc(2010, 10, 16),
  //       lastDay: DateTime.utc(2030, 3, 14),
  //       focusedDay: DateTime.now(),
  //     ),
  //   );
  // }
}
