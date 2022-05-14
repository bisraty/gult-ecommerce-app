import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/Categorypage.dart';
import 'package:ecommerce/Components/Card.dart';
import 'package:ecommerce/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Carousel_slider.dart';
import 'FitterbyCategory.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int Selected = 0;
  int _currentIndex = 0;
  List<String> images = [
    'assets/Banner@2x.png',
    'assets/Apparel _ Textiles@1x.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FBF9),
      drawer: Drawer(
        child: Material(
          color: Color(0xffEAF4FC),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // CircleAvatar(
                    //   backgroundColor: Colors.white,
                    //   radius: 25,
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //
                    //
                    //   ],
                    // )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Divider(color: Colors.teal),

                    Divider(color: Colors.teal),
                    // buildMenuItem(
                    //   text: 'About us',
                    //   icon: Icons.info,
                    //   onClicked: () => selectedItem(context, 4),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: Color.fromRGBO(71, 195, 144, 1),
        backgroundColor: Color(0xffF6F6F6).withOpacity(1),
        items: <Widget>[
          Icon(Icons.home,
              size: 30, color: Selected == 0 ? Colors.white : Colors.grey[700]),
          Icon(Icons.category,
              size: 30, color: Selected == 1 ? Colors.white : Colors.grey[700]),
          Icon(Icons.local_shipping,
              size: 30, color: Selected == 2 ? Colors.white : Colors.grey[700]),
        ],
        onTap: (int index) {
          print(index);
          setState(() {
            Selected = index;
          });
          //Handle button tap
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF6F6F6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gulit",
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
            IconButton(
                icon: Icon(Icons.account_circle_outlined,
                    color: Color(0xff403B58)),
                onPressed: () {})
          ],
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(71, 195, 144, 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Selected == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 500,
                    child: CarouselSlider(
                        items: images
                            .map((String item) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                            image: AssetImage(item.toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlay: true,
                            disableCenter: false,
                            onPageChanged: (index, reason) {
                              setState(
                                () {
                                  _currentIndex = index;
                                },
                              );
                            })),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((urlOfItem) {
                      int index = images.indexOf(urlOfItem);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromRGBO(71, 195, 144, 1)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  // boxShadow: const [
                                  //   BoxShadow(
                                  //     color: Colors.white,
                                  //     blurRadius: 3,
                                  //     offset: Offset(3, 3),
                                  //   ),
                                  // ],
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: TextField(
                                  cursorHeight: 20,
                                  autofocus: false,
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      prefixIcon: Icon(Icons.search_outlined),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                      border: InputBorder.none
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   borderSide:
                                      //       BorderSide(color: Colors.white, width: 0),
                                      // ),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   borderSide:
                                      //       BorderSide(color: Colors.grey, width: 0),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   gapPadding: 0.0,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   borderSide: BorderSide(
                                      //       color: Colors.grey, width: 1.5),
                                      // ),
                                      ),
                                ))),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 47,
                            width: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color(0xFF47C390),
                                    const Color(0xFF63F082),
                                  ],
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(71, 195, 144, 1),
                                ),
                                color: Color.fromRGBO(71, 195, 144, 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: IconButton(
                              icon: const Icon(
                                Icons.menu_open,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, bottom: 0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 3,
                            //     width: 70,
                            //     color: Color.fromRGBO(71, 195, 144, 1),
                            //   ),
                            // )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                Selected = 1;
                              });
                            },
                            child: const Text(
                              "See more",
                              style: TextStyle(
                                color: Color.fromRGBO(71, 195, 144, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Card(
                        child: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * .97,
                            // color:Colors.pink,
                            child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push<MaterialPageRoute>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Fitterbycat(),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            elevation: 2,
                                            child: Container(
                                              width: 120,
                                              // height: 220,
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   color: Colors.grey[400],
                                                  // ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,

                                                // ignore: always_specify_types
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/Agriculture _ Food@1x.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: const Text(
                                                        "Agriculture & Food",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 2,
                                            child: Container(
                                              width: 120,
                                              // height: 220,
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   color: Colors.grey,
                                                  // ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // ignore: always_specify_types
                                                children: [
                                                  Image.asset(
                                                    'assets/Electronics@2x.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: const Text(
                                                        "Electronics",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 2,
                                            child: Container(
                                              width: 120,
                                              // height: 220,
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   color: Colors.grey,
                                                  // ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // ignore: always_specify_types
                                                children: [
                                                  Image.asset(
                                                    'assets/Apparel _ Textiles@2x.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: const Text(
                                                        "Apparel & Textiles",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )))),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Featured products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     height: 3,
                          //     width: 120,
                          //     color: Color.fromRGBO(71, 195, 144, 1),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Cards(Data: images),
                ],
              )
            : Selected == 1
                ? Category()
                : Container(),
      ),
    );
  }
}
