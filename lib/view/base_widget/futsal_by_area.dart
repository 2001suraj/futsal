// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_by_area_model.dart';
import 'package:futsal/data/repository/get/futsal_by_area_repo.dart';

import '../screen/futsal_by_area/components/area_single_home_slider_page.dart';

SizedBox futsal_by_area({required String area_id}) {
  return SizedBox(
    width: double.infinity,
    child: FutureBuilder<FutsalByAreaModel>(
      future: FustalByAreaRepo().fustalByAreaRepo(area_id: area_id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              itemCount: snapshot.data!.userData!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AreaSingelHomeSliderPage(
                                  model1: snapshot.data!.userData![index],
                                )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 155,
                        height: 120,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(snapshot
                                  .data!.userData![index].logo
                                  .toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(snapshot
                                    .data!.userData![index].futsalName
                                    .toString()),
                      )
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
  );
}
