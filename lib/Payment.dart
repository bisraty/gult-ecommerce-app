// ignore_for_file: unnecessary_parenthesis

import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.grey[700], fontSize: 15),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[700]),
      ),
      body: (SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[100],
            child: Column(
              // ignore: always_specify_types
              children: [
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const ListTile(
                      tileColor: Colors.transparent,
                      leading: Icon(
                        Icons.payment,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text('PayPal'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const ListTile(
                      tileColor: Colors.transparent,
                      leading: Icon(
                        Icons.payment,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text('Mastercard'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const ListTile(
                      tileColor: Colors.transparent,
                      leading: Icon(
                        Icons.payment,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text('Visa'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const ListTile(
                      tileColor: Colors.transparent,
                      leading: Icon(
                        Icons.payment,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text('Telebirr'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const ListTile(
                      tileColor: Colors.transparent,
                      leading: Icon(
                        Icons.payment,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text('Amole'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
