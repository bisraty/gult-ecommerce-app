import 'dart:convert';

import 'dart:io';
import 'package:ecommerce/Homepage.dart';

import 'package:ecommerce/config.dart';

import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();
  String token = "";
  //var id;
  String status = "";
  String UserName = "";
  String sms = "";
  bool connected = true;
  bool isloading = false;
  final result = Connectivity().checkConnectivity();

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('connected');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('connected');
      return true;
    }
    setState(() {
      connected = false;
    });
    _showDialog(context);
    print('not connected');
    return false;
  }

  void _showDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text(
                "You are disconnected to the Internet.",
                textAlign: TextAlign.center,
              ),
              content: new Text("Please check your internet connection",
                  textAlign: TextAlign.center),
              actions: <Widget>[
                new TextButton.icon(
                  label: Text(
                    'Retry',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => super.widget));
                  },
                  icon: Icon(Icons.replay_rounded, color: Colors.red),
                )
              ]);
        });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    //fetchpost();

    //check();
  }

  // editing controller
  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,

          enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          // prefixIcon: Icon(
          //   Icons.mail,
          //   size: 20,
          //   color: Color(0xff03658C),
          // ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email address",
          border: InputBorder.none,
        ));

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none, fillColor: Colors.white,
        filled: true,
        // prefixIcon: Icon(
        //   Icons.vpn_key,
        //   size: 20,
        //   color: Color(0xff03658C),
        // ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your Password",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Color.fromRGBO(71, 195, 144, 1),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          height: 10,
          onPressed: () {
            setState(() {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                isloading = false;
              } else {
                isloading = true;
              }
            });
            login();
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => Mainpage(token: token)));
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Mainpage()));
          },
          child: isloading == true
              ? CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(22, 33, 63, 1),
                )
              : Text(
                  "Log-in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(
      //         Icons.dashboard,
      //         color: Colors.white,
      //       )),
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Color(0xff03658C),
      //   title: Text(
      //     'A2P BULK SMS',
      //     style: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: connected == false
          ? Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        const AssetImage('images/no_internet_connection.png'),
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 118,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                    child: Row(
                      children: [
                        Text("Sign in  to",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey[900])),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                    child: Row(
                      children: [
                        Text("GULIT-Delivary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(71, 195, 144, 1),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * .339,
                  //   color: Colors.white,
                  //   // decoration: BoxDecoration(
                  //   //     color: Color(0xff03658C),
                  //   //     borderRadius:
                  //   //         BorderRadius.only(bottomLeft: Radius.circular(10))),
                  //   child: SvgPicture.asset("images/Signbanner.svg"),
                  // ),
                  Card(
                    elevation: 3,
                    child: Container(
                      width: 370,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       'Customer Log-In',
                                //       style: TextStyle(
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.bold,
                                //         color: Color(0xff03658C),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   children: [
                                //     Text(
                                //       'log-in',
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),

                                Row(
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),

                                SizedBox(height: 10),
                                emailField,
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                passwordField,
                                SizedBox(height: 35),
                                loginButton,
                                SizedBox(height: 15),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account ? ",
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(22, 33, 63, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      )
                                    ]),
                                SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Map<String, String> get header => {
        "Accept": "application/json",
      };

  Future<Map<String, dynamic>> fetchpost() async {
    final response = await http.post(Uri.parse("$baseuri/login"),
        headers: {HttpHeaders.authorizationHeader: "Token"});

    // final responsejson = jsonDecode(response.body);
    // print("Result: ${response.body}");

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', responsejson['token']);
    /// print("{$responsejson}");
    // return responsejson;
  }

  // ignore: missing_return
  void login() async {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (context) => Homepage()));
    print(
      emailController.text.toString(),
    );

    print(
      passwordController.text.toString(),
    );
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("$baseuri/login"),
          headers: header,
          body: ({
            'email': emailController.text.toString(),
            'password': passwordController.text.toString(),
          }));
      print(response.body);

      print(response.body);
      //var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isloading = false;
        // print(jsonResponse['data']);
        // token = jsonResponse['data']['token'].toString();
        // UserName = jsonResponse['data']['user_name'].toString();
        // status = jsonResponse['data']['status'].toString();
        // id = jsonResponse['data']['company']['id'].toString();

        //  print("this is id" + id);

        print(token);

        await SharedPreferences.getInstance().then((pref) {
          pref.setString("sms", sms);
        });

        await SharedPreferences.getInstance().then((pref) {
          pref.setString("token", token);
        });
        await SharedPreferences.getInstance().then((pref) {
          pref.setString("username", UserName);
        });
        await SharedPreferences.getInstance().then((pref) {
          pref.setString("status", status);
        });

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Mainpage(
        //               token: token,
        //             )));
      } else {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text("Invalid credential")));
      }

      if (response.statusCode != 200) {
        setState(() {
          isloading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("All fields must Filled")));
    }
  }
}
/*
class User {
  String id;
  String full_name;
  String user_name;
  String email;
  String role;
  String status;
  String token;
  String phone_number;
  String tin_number;
  String business_license;
  String vat_certificate;
  String taxpayer_registration_certificate;
  String email_verified_at;
  String profile_approval;
  String profile_image_path;
  String ref_num;
  String plan_id;
  String key;
  String created_at;
  String updated_at;
  User(
      {this.id,
      this.full_name,
      this.phone_number,
      this.tin_number,
      this.business_license,
      this.vat_certificate,
      this.taxpayer_registration_certificate,
      this.email_verified_at,
      this.profile_approval,
      this.profile_image_path,
      this.ref_num,
      this.plan_id,
      this.key,
      this.created_at,
      this.updated_at,
      this.user_name,
      this.email,
      this.role,
      this.status,
      this.token});*/

