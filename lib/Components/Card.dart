import 'package:ecommerce/Checkout.dart';
import 'package:ecommerce/Detailpage.dart';
import 'package:ecommerce/Product_Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Cards extends StatefulWidget {
  Cards({this.Data});
  final List Data;
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Center(
              child: InkWell(
                onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DetailPage(),
                    )),
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .27,
                            width: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/ቀይ ሽንኩርት(1kg)@1x.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "ቀይ ሽንኩርት(1kg)",
                                            style: TextStyle(
                                                //     fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          "ከበላይ የአትክልትና አስቤዛ ማከፋፈያ እና ችርቻሮ የሀበሻ ሽንኩርት፣ደረጃ አንድ ወፍራም፤በጅምላ  እንደሚገዙት መጠን ዋጋ ማሻሻያ ይኖራል፡፡",
                                          overflow: TextOverflow.clip,
                                          maxLines: 3,
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .32,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                "100 birr",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        71, 195, 144, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 40,
                                            // ),
                                            InkWell(
                                              onTap: () => Navigator.push<
                                                      MaterialPageRoute>(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Checkout(),
                                                  )),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color.fromRGBO(
                                                          71, 195, 144, 1),
                                                    ),
                                                    color: Color.fromRGBO(
                                                        71, 195, 144, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                18))),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Buy",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // RatingBar.builder(
                                    //   initialRating: 3,
                                    //   itemSize: 20,
                                    //   minRating: 1,
                                    //   direction: Axis.horizontal,
                                    //   allowHalfRating: true,
                                    //   itemCount: 5,
                                    //   itemPadding:
                                    //       EdgeInsets.symmetric(horizontal: 4.0),
                                    //   itemBuilder: (context, _) => Icon(
                                    //     Icons.star,
                                    //     color: Color.fromRGBO(71, 195, 144, 1),
                                    //   ),
                                    //   onRatingUpdate: (rating) {
                                    //     print(rating);
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
