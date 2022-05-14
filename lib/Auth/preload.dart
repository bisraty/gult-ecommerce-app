import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login.dart';

class PreloadContent extends StatefulWidget {
  @override
  _PreloadContentState createState() => _PreloadContentState();
}

/// this file contains the logic of
/// fetchiing pre conents that are essential
/// for the app
class _PreloadContentState extends State<PreloadContent> {
  bool genreLoading = false;
//service locator setup

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 4000), () {
      Navigator.of(context)
          .push<void>(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  // Text(
                  //   'Addis Learning',
                  //   style: TextStyle(color: Colors.cyan, fontSize: 20),
                  // ),
                  Container(
                      //    color: Colors.white,
                      //  color: Colors.black,

                      child: Lottie.asset("assets/delivery-truck.json"))
                ],
              ),
            ),
          ),
        ));
  }
}
