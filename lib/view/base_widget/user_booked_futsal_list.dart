// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:futsal/data/model/user_booked_futsal_list_model.dart';
import 'package:futsal/data/repository/get/user_booked_futsal_list_repo.dart';
import 'package:futsal/data/repository/post/cancel_futsal_booking_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';

Consumer user_booked_futsal_list({ required String status}) {
  return Consumer<LoginProvider>(
    builder: (context, value, child) => FutureBuilder<UserBookedFutsalListModel>(
      future: UserBookedFutsalListRepo().userBookedFutsalListRepo(
          user_id: '${value.user()!.id.toString()}', status: status),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Do you want to cancel your Booking',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  content: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          CancelFutsalBookingRepo()
                                              .cancelFutsalBookingrepo(
                                                  userid:value.user()!.id.toString(),
                                                  booking_id: snapshot.data!.data![index].bookingId.toString(),
                                                  context: context);
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                               width:MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //image
                                  Container(
                                    width: 140,
                                    height: 110,
                                    margin: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0, 0),
                                              blurRadius: 6)
                                        ],
                                        color: Colors.white),
                                    child: Image.network(
                                      snapshot.data!.data![index].logo
                                          .toString(),
                                    ),
                                  ),
                            
                                  //detail container
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                         SizedBox(
                                          height: 25,
                                        ),
                                        //futsal name
                                        Text(
                                          snapshot.data!.data![index].futsalName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //address
                                        customtxt(
                                            text: snapshot
                                                .data!.data![index].address
                                                .toString()),
                                                              
                                        //starting time. and ending time
                                        customtxt(
                                          text: snapshot
                                                  .data!.data![index].startTime
                                                  .toString() +
                                              " - " +
                                              snapshot
                                                  .data!.data![index].endTime
                                                  .toString(),
                                        ),
                                                              
                                        //status
                                        customtxt(
                                            text: snapshot
                                                .data!.data![index].status
                                                .toString()),
                                                              
                                        //date
                                                              
                                        Text(
                                          "Booking Date : " +
                                              snapshot.data!.data![index]
                                                  .bookingDate
                                                  .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
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

Text customtxt({required String text}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Colors.grey,
    ),
  );
}
