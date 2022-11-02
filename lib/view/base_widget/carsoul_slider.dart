// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Carouselsiders extends StatelessWidget {
  const Carouselsiders({
    Key? key,
    required this.carousellist,
  }) : super(key: key);

  final List<Widget> carousellist;

  @override
  Widget build(BuildContext context) {
    return 
  
        CarouselSlider(
          items: carousellist
              .map(
                (itemm) => Row(
                  children: [itemm],
                ),

               
              )
              .toList(),
          options: CarouselOptions(
              // scrollDirection: Axis.horizontal,
              // height: 200,
              viewportFraction: 1.5,
              // autoPlay: true,
              // aspectRatio: 4 / 3
              ),
        );
   
  }
}