// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/all_futsal_location_model.dart';
import 'package:futsal/data/repository/get/all_futsal_location_repo.dart';
import 'package:futsal/view/base_widget/futsal_by_area.dart';
import 'package:futsal/view/screen/futsal_by_area/futsal_by_area.dart';

SizedBox all_futsal_location() {
  return SizedBox(
    height: 40,
    width: double.infinity,
    child: FutureBuilder<AllFutsalLocationModel>(
      future: AllFutsalLocationRepo().allFutsalLocationRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.userData!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FutsalByAreaScreen(
                                area_name: snapshot.data!.userData![index].areaName
                                    .toString(),
                                area_id: snapshot.data!.userData![index].areaId
                                    .toString(),
                              ),
                            ),
                          );
                        },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${snapshot.data!.userData![index].areaName.toString()}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
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
  );
}
