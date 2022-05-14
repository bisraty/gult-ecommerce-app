import 'package:ecommerce/Billing_information.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    onTap: () => Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Billing(),
                        )),
                    leading: Icon(
                      Icons.person_rounded,
                      color: Color.fromRGBO(71, 195, 144, 1),
                    ),
                    title: Text('Billing information',
                        style: TextStyle(color: Colors.grey[700])),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      leading: Icon(
                        Icons.home,
                        color: Color.fromRGBO(71, 195, 144, 1),
                      ),
                      title: Text(
                        'Delivary Method',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    leading: Icon(
                      Icons.payment,
                      color: Color.fromRGBO(71, 195, 144, 1),
                    ),
                    title: Text('Payment Method',
                        style: TextStyle(color: Colors.grey[700])),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: Color.fromRGBO(71, 195, 144, 1), fontSize: 12),
                    ),
                    Text(
                      "120 Birr",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(71, 195, 144, 1),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              // onTap: () => Navigator.push<MaterialPageRoute>(
              //     context,
              //     MaterialPageRoute(
              //       builder: (BuildContext context) => Billing(),
              //     )),
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[100],
                    ),
                    color: Colors.grey,
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
    );
  }
}
