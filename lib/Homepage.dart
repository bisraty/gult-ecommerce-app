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
  int Selected=0;
  List<String> images = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      drawer:Home_drawer(),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor:Color(0xffFA543B),
        backgroundColor:   Color(0xffF6F6F6).withOpacity(1),

        items: <Widget>[
          Icon(Icons.home, size: 30,),
          Icon(Icons.category, size: 30, ),
          Icon(Icons.local_shipping, size: 30, ),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            Selected=index;
          });
          //Handle button tap
        },
      ),
      appBar: AppBar(
elevation: 0,
        backgroundColor: Color(0xffF6F6F6),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("homepage",style: TextStyle(
              color:Color(0xff403B58)
            ),),
            IconButton(icon:Icon(
              Icons.account_circle_outlined,
                color:Color(0xff403B58)
            ), onPressed: (){})
          ],
        ),
        iconTheme: IconThemeData(color: Color(0xff403B58)),
      ),
   body: SingleChildScrollView(
     child:Selected==0?
     Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           height: 220,
           width: MediaQuery.of(context).size.width*8,
           child: CarouselSlider(
               items: images
                   .map((item) => Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(

                 padding: EdgeInsets.all(10),
                 width: MediaQuery.of(context).size.width*1,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                       image: DecorationImage(image:NetworkImage(item.toString()),fit: BoxFit.cover)
                 ),

               ),
                   )) .toList(),
               options: CarouselOptions(
                 autoPlay: true,
                 disableCenter: false,
               )),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               Expanded(
                 child: Container(
      decoration: BoxDecoration(
      boxShadow: const [
      BoxShadow(
      color: Colors.white,
      blurRadius: 3,
      offset: Offset(3, 3),
      ),
      ],
      borderRadius: BorderRadius.circular(
      10.0,
      ),),
                   child: TextField(
                     cursorHeight: 20,
                     autofocus: false,
                     controller: TextEditingController(),
                     decoration: InputDecoration(

                       hintText: "Search",
                       prefixIcon: Icon(Icons.search_outlined),

                       contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.grey, width: 2),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.grey, width: 1.5),
                       ),
                       focusedBorder: OutlineInputBorder(
                         gapPadding: 0.0,
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.grey, width: 1.5),
                       ),
                     ),
                   ),
                 ),
               ),
               SizedBox(width: 5,),

               Container(
                   padding: const EdgeInsets.only(left:10.0),
                 height: 47,
                 width: 60,
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.grey,
                       ),
                       color: Colors.white,

                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   child: IconButton(icon: Icon(
      Icons.menu_open,
      ),)
               )
             ],
           ),
         ),
SizedBox(
  height: 10,
),
         Padding(
           padding: const EdgeInsets.only(left:8.0,bottom: 10,top: 5),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Categories"),
                   Container(
                       height: 3,
                       width:40,
                       color:Color(0xffFA533C)
                   )
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(right:8.0),
                 child: TextButton(onPressed: (){
                   setState(() {
                     Selected=1;
                   });
                 }, child: Text("See more",style: TextStyle( color:Color(0xffFA533C)),),),
               )
             ],
           ),
         ),
Container(
  height: 80,
  width: MediaQuery.of(context).size.width*.97,
  // color:Colors.pink,
  child:ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: 14,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Fitterbycat()));
              },
              child: Container(
                height: 40,
                width:70,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    IconButton(icon:Icon(
                      Icons.car_rental
                    ), onPressed: (){}),
                    Text("Cars",style: TextStyle(
                      fontSize: 10
                    ),)
                  ],
                ),
              ),
            ),
          );
        })

),
         Padding(
           padding: const EdgeInsets.only(left:8.0,bottom: 10,top: 5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Featured products"),
               Container(
                 height: 3,
                 width:40,
                   color:Color(0xffFA533C)
               )
             ],
           ),
         ),

      Cards(Data:images),
       ],
     ):Selected==1?Category():Container(),
   ),
    );
  }
}
