import 'package:flutter/material.dart';
class Category extends StatefulWidget {

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width:MediaQuery.of(context).size.width*1 ,
        // height: MediaQuery.of(context).size.height*.75,
        child: GridView.count(
            childAspectRatio: 1.2,
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            children: List.generate(8, (index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.white,

                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: FadeInImage(
                                  height: 70,
                                  width: 70,
                                  placeholder: AssetImage(
                                      'assets/placeholder.png'),
                                  image: NetworkImage(
                                    "data:image/png;base64,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"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Cars",
                                  style: TextStyle(
                                      fontSize: 15,color: Colors.black),),
                              ),

                            ]
                        ),
                      ),
                    ),
                  ),
                )
                ,
                // child: SelectCard(choice: choices[index]),
              );
            }))
    );
  }
}
