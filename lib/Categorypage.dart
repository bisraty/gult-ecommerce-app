import 'package:ecommerce/FitterbyCategory.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          //  width: MediaQuery.of(context).size.width * 1,
          //   height: MediaQuery.of(context).size.height * .75,
          child: GridView.count(
              //  childAspectRatio: 0.2,
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(3, (index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push<MaterialPageRoute>(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Fitterbycat(),
                              ));
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (index == 0)
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0.0),
                                      child: ClipRRect(
                                        child: FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/placeholder.png'),
                                          image: AssetImage(
                                              'assets/Agriculture _ Food@2x.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 0),
                                      child: Text(
                                        "Agriculture & Food",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                              if (index == 1)
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0.0),
                                      child: ClipRRect(
                                        child: FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/placeholder.png'),
                                          image: AssetImage(
                                              'assets/Electronics@2x.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 0),
                                      child: Text(
                                        "Electronics",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                              if (index == 2)
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0.0),
                                      child: ClipRRect(
                                        child: FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/placeholder.png'),
                                          image: AssetImage(
                                              'assets/Apparel _ Textiles@2x.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 0),
                                      child: Text(
                                        "Apparel & Textiles",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                            ]),
                      ),
                    ),
                  ),

                  // child: SelectCard(choice: choices[index]),
                );
              }))),
    );
  }
}
