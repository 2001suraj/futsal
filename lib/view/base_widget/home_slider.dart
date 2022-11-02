// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';


Container home_slider() {
  return Container(
    child: FutureBuilder<HomeSliderModel>(
      future: HomSliderRepo().homSliderRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
            itemCount: snapshot.data!.data!.homeSlider!.length,
            itemBuilder: ((context, index, realIndex) {
              final imageurl =
                  snapshot.data!.data!.homeSlider![index].image.toString();
              return Container(
                margin:EdgeInsets.symmetric(horizontal: 9
                
                )
                ,
                child: Image.network(imageurl,fit: BoxFit.cover,),
              );
            }),
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 220,
                viewportFraction: 1,
                autoPlay: true,
                aspectRatio: 3 / 2),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}


