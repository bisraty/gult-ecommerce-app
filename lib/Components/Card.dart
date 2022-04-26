import 'package:flutter/material.dart';
class Cards extends StatefulWidget {
 Cards({this.Data});
 final List Data;
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,

        itemCount: widget.Data.length,
        itemBuilder: (context,index){
          return   Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.width*.85,

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.27,
                        width: MediaQuery.of(context).size.width*.35,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(image:NetworkImage(widget.Data[index].toString()),fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.25,

                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text("wedding product",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text("Furniture Shop Mobile Apps \n Furniture Shop Mobile Apps",style: TextStyle(

                                    fontSize: 12
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                  width: MediaQuery.of(context).size.width*.32,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("100 birr",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),),
                                      ),
                                      // SizedBox(
                                      //   width: 40,
                                      // ),
                                      Container(
                                        height: 40,
                                        width: 60,

                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            color: Color(0xff403B58),

                                            borderRadius: BorderRadius.all(Radius.circular(18))
                                        ),
                                        child:Center(
                                          child: Text("Buy",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18
                                          ),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
