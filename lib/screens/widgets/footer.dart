import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  var imgList = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: CarouselSlider(
          options: CarouselOptions(autoPlay: true),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child: Image.asset(
                            'assets/images/comp_${item.toString()}.jpg')),
                  ))
              .toList(),
        ));
  }
}
