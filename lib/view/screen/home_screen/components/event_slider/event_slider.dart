// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';
import 'package:futsal/view/screen/home_screen/components/event_slider/components/event_page.dart';

Padding eventslider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Events ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            TextButton(onPressed: () {}, child: Text('See All'))
          ],
        ),
        SizedBox(
          height: 300,
          child: FutureBuilder<HomeSliderModel>(
            future: HomSliderRepo().homSliderRepo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.eventSlider!.length,
                    itemBuilder: (context, index) {
                      final imageurl = snapshot
                          .data!.data!.homeSlider![index].image
                          .toString();
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventSinglePage(
                                    eventSlider:snapshot.data!.data!.eventSlider![index] 
                                    ,)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(imageurl),
                                      fit: BoxFit.cover)),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 148.0, right: 75, left: 5, bottom: 20),
                                child: Card(
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4, left: 12),
                                    child: Text(
                                      snapshot
                                          .data!.data!.eventSlider![index].title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, left: 16, bottom: 2),
                              child: Text(
                                snapshot
                                    .data!.data!.eventSlider![index].organizer
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                snapshot.data!.data!.eventSlider![index].date
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ],
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
        )
      ],
    ),
  );
}
