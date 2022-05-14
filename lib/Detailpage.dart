import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Checkout.dart';
import 'Components/Feedback.dart';
class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentIndex = 0;
  List<String> images = [
    "assets/ቀይ ሽንኩርት(1kg)@1x.png",
    "assets/ቀይ ሽንኩርት(1kg)@2x.png",
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*4,
            color: Colors.white,
          ),
          Positioned.fill(child: Align(
            alignment: Alignment.topCenter,
            child:  Container(
              height: MediaQuery.of(context).size.height*0.37,
              width: MediaQuery.of(context).size.width*1,
              child: Stack(
                children: [
                  CarouselSlider(

                      items: images
                          .map((String item,) => Container(
                            // padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height*0.5,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(

                                image: DecorationImage(
                                    image:AssetImage(item.toString(),

                                    ),
                                   scale: 4,
                                    fit: BoxFit.cover)),
                          ))
                          .toList(),
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height*0.4,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          autoPlay: false,
                          disableCenter: false,
                          onPageChanged: (index, reason) {
                            print(index);
                           setState(() {
                             _currentIndex= index;
                           });
                          })),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Card(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(left:15,top:27.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:5.0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Product Detail",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                    Positioned(
                    top: MediaQuery.of(context).size.height*0.32,
                    child: Container(
                    height: MediaQuery.of(context).size.height*.06,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    child:  Row(
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
                    ))

                ],
              ),
            ),
          )),
          Positioned(
            top: MediaQuery.of(context).size.height*0.38,
            child: Container(
              height: MediaQuery.of(context).size.height*.7,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top:12.0,right: 15,left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ቀይ ሽንኩርት(1kg)",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            // color:Colors.black
                          ),),
                          Text("26.00",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color:Color(0xff47C390)
                          ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0,top:8,right: 12),
                      child: Text("ከበላይ የአትክልትና አስቤዛ ማከፋፈያ እና ችርቻሮ የሀበሻ  ሽንኩርት፣ደረጃ አንድ ወፍራም፤ በጅምላ እንደሚገዙት መጠን ዋጋ ማሻሻያ ይኖራል፡፡",style: TextStyle(
                          fontSize: 16,

                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0,top:40,right: 12),
                      child: Text("User Feedback",style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color:Color(0xff47C390)
                      ),),
                    ),
                    Feedbackcomponent()
                  ],
                ),
              ),
            ),

          ),

        ],

      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width*.8,
        child: Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: InkWell(
            onTap: () => Navigator.push<
                MaterialPageRoute>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext
                  context) =>
                      Checkout(),
                )),
            child: Container(
              height: 60,

              child:Center(
                child: Text("Buy",style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color:Colors.white
                ),),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff47C390),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
          ),
        ),
      ),
    );
  }
}
