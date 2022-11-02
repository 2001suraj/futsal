// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';
import 'package:futsal/view/screen/home_screen/components/home_slider/components/home_slider_single_page.dart';

Container tophomeSlider() {
  return Container(
    height:  350,
      child: Expanded(
    child: FutureBuilder<HomeSliderModel>(
      future: HomSliderRepo().homSliderRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.data!.futsalSlider!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingelHomeSliderPage(
                               model1: snapshot.data!.data!.futsalSlider![index],
                            )));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 10, bottom: 10, top: 5),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 230,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(snapshot
                                    .data!.data!.futsalSlider![index].logo
                                    .toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          snapshot.data!.data!.futsalSlider![index].futsalName
                              .toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: Text(
                            snapshot.data!.data!.futsalSlider![index].address
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  ));
}
