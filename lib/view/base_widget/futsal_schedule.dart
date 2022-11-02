// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'package:futsal/data/model/futsal_schedule_model.dart';
import 'package:futsal/data/repository/get/futsal_schedule_repo.dart';

SizedBox futsal_schedule(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 300,
    child: FutureBuilder<FutsalScheduleModel>(
      future: FutsalScheduleRepo().futsalScheduleRepo(
          date: DateTime.now(), futsal_id: 6, ground_id: 1, context: context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              // itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      child: Row(
                        children: [
                          Text(
                            '${snapshot.data!.data![index].scheduleId.toString()}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${snapshot.data!.data![index].startTime.toString()}' +
                                '-' +
                                '${snapshot.data!.data![index].endTime.toString()}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   '${snapshot.data!.data![index].endTime.toString()}',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
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
