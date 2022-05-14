import 'package:flutter/material.dart';
class Feedbackcomponent extends StatefulWidget {

  @override
  _FeedbackcomponentState createState() => _FeedbackcomponentState();
}

class _FeedbackcomponentState extends State<Feedbackcomponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      child: Column(
        children: [
          ListView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left:12.0,right: 8,bottom: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(

                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(text: 'Yodit Kasa',
                              style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20
                          )),
                          TextSpan(text: '         4.5'),
                        ],
                      ),
                    ),
                    Text("Jan 26, 2022",style: TextStyle(
                        fontSize: 14,

                        color:Colors.grey
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Text("ከበላይ የአትክልትና አስቤዛ ማከፋፈያ እና ችርቻሮ የሀበሻ  ሽንኩርት፣ ደረጃ አንድ ወፍራም፤ በጅምላ እንደሚገዙት መጠን ዋጋ ማሻሻያ ይኖራል፡፡",style: TextStyle(
                          fontSize: 17,

                      ),),
                    ),
                  ],
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(bottom:500.0),
            child: Container(
              width: MediaQuery.of(context).size.width*.95,
              child: TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Feedback',
                  suffixIcon: IconButton(
                    icon: Icon(
                        Icons.send,
                        color: Color(0xff47C390)
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xff47C390), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xff47C390), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
