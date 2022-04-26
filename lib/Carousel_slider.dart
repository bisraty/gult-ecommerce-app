import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Sliderpart extends StatefulWidget {

  @override
  _SliderpartState createState() => _SliderpartState();
}

class _SliderpartState extends State<Slider> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: images
            .map((item) => Container(
          height: 200,
          width: MediaQuery.of(context).size.width*.8,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(item.toString()),fit: BoxFit.cover)
          ),

        )) .toList(),
        options: CarouselOptions(
          autoPlay: true,
          disableCenter: false,
        ));
  }
}
