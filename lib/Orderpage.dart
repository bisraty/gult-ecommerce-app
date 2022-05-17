import 'package:ecommerce/Components/Longdistancedetailpage.dart';
import 'package:ecommerce/Components/Pickupdetailpage.dart';
import 'package:flutter/material.dart';

import 'Components/ExpressDetailpage.dart';
class Order extends StatefulWidget {

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int select=0;
  List items=[
    {
    'title': "ቀይ ሽንኩርት(1kg)",
    'type':"Self Pickup",
      'address':'Bola shop',
     "date":"4:00 AM",
  'price':"45 birr"
  },
    {
      'title': "ቀይ ሽንኩርት(5kg)",
      'type':"Express",
      "date":" with in 1:00 hour",
      'price':"200 birr"
    },
    {
      'title': "ቀይ ሽንኩርት(100kg)",
      'type':"Long Distance",
      "date":"Monday,may 16",
      'price':"4500 birr"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,top: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        select=0;
                      });
                    },
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("Active",
                          style: TextStyle(
                          fontSize: 20,
                            color:  select==0?Color.fromRGBO(71, 195, 144, 1):Colors.black
                        ),),
                        select==0?Container(height: 3,width: 40,color:Color.fromRGBO(71, 195, 144, 1),):Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        select=1;
                      });
                    },
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("History", style: TextStyle(
                            fontSize: 20,
                            color:  select==1?Color.fromRGBO(71, 195, 144, 1):Colors.black
                        ),),
                       select==1? Container(height: 3,width: 40,color: Color.fromRGBO(71, 195, 144, 1),):
                           Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        select==0?
        ListView.builder(
            shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    onTap: (){
                      if(items[index]['type']=="Self Pickup"){
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context)=>Pickuppage()));
                      }
                      else if(items[index]['type']=="Express"){
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context)=>Expresepage()));
                      }
                      else{
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context)=> LongDistancepage()));
                      }

                    },
                    tileColor: Colors.white,
                    title: Text('${items[index]['title']}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    isThreeLine: true,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${items[index]['date']}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),
                        items[index]['type']=="Self Pickup"? Text('Shop Location: ${items[index]['address']}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),):

                        Text('Price: ${items[index]['price']}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),
                        items[index]['type']=="Express"?
                        Text('In Progress',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green
                          ),):Container(),
                      ],
                    ),
                    leading:Container(
                      height:80,
                      width:60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.green,
                        image: DecorationImage(
                          image:AssetImage("assets/ቀይ ሽንኩርት(1kg)@1x.png"),
                          fit: BoxFit.cover,),
                      ),
                    ),
                    trailing:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:20,
                          width:20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00F09A),

                          ),
                        ),
                        Text('${items[index]['type']}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),
                );
              }):Container()
        ],
      ),
    );
  }
}
