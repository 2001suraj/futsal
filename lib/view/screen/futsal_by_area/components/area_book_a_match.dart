// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_by_area_model.dart';
import 'package:futsal/data/model/futsal_ground_list_model.dart';
import 'package:futsal/data/model/futsal_schedule_model.dart';
import 'package:futsal/data/repository/get/futsal_ground_list_repo.dart';
import 'package:futsal/data/repository/get/futsal_schedule_repo.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/provider/selected_futsal.dart';
import 'package:futsal/view/screen/futsal_by_area/components/area_book_info_screen.dart';
import 'package:futsal/view/screen/home_screen/components/home_slider/components/custome_btn_row.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AreaBooKAMatchScreen extends StatefulWidget {
  AreaBooKAMatchScreen({Key? key, required this.model1}) : super(key: key);
  FutsalByAreadataModel model1;

  @override
  State<AreaBooKAMatchScreen> createState() => _AreaBooKAMatchScreenState();
}

class _AreaBooKAMatchScreenState extends State<AreaBooKAMatchScreen> {
  TextEditingController controller = TextEditingController();

  DateTime focusedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime selectedDay = DateTime.now();

  MaterialColor? color1;

  FutsalScheduleDataModel schedulemodel = FutsalScheduleDataModel();

  @override
  Widget build(BuildContext context) {
    SelectedFutsalProvider selectedFutsalProvider =
        Provider.of<SelectedFutsalProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.model1.futsalName.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Match Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select your prefered data & time for the match',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                //date time picker
                TableCalendar(
                  calendarFormat: CalendarFormat.twoWeeks,
                  firstDay: DateTime(
                    1990,
                  ),
                  lastDay: DateTime(2050),
                  focusedDay: focusedDay,
                  onDaySelected: (selectDay, focuseDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focuseDay;
                    });
                    print(selectDay);
                    print(focuseDay);
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDay, day);
                  },
                ),
                SizedBox(height: 30),
                //futsal ground list
                SizedBox(
                  width: double.infinity,
                  height: 480,
                  child: FutureBuilder<FutsalGroundListModel>(
                    future: FutsalGroundListRepo().futsalGroundListRepo(
                        futsal_id: int.parse(widget.model1.id.toString())),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ground name
                          children: [
                            Text('Pick your Ground',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 2,
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  '${snapshot.data!.userData![0].groundName.toString()}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            //available selected booked
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                customRowbtnColor(
                                    Colors.grey.withOpacity(0.7), 'Available'),
                                // customRowbtnColor(
                                //     Colors.green.withOpacity(0.7),
                                //     'Selected'),
                                customRowbtnColor(
                                    Colors.lightBlue.withOpacity(0.5),
                                    'Booked'),
                              ],
                            ),
                            SizedBox(height: 30),
                            //schedule id
                            Text(
                              'Schedule Id',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            // getting futsal schedule
                            SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: FutureBuilder<FutsalScheduleModel>(
                                future: FutsalScheduleRepo().futsalScheduleRepo(
                                    context: context,
                                    date: focusedDay,
                                    futsal_id: int.parse(snapshot
                                        .data!.userData![0].futsalId
                                        .toString()),
                                    ground_id: int.parse(snapshot
                                        .data!.userData![0].groundId
                                        .toString())),
                                builder: (context, snapshot1) {
                                  if (snapshot1.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot1.hasData) {
                                    return ListView.builder(
                                      itemCount: snapshot1.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot1.data!.data![index]
                                                .bookingStatus ==
                                            'Booked') {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  {
                                                    showSnackBar(
                                                        'Futsal Already booked  ',
                                                        context,
                                                        color: Colors.cyan);
                                                  }
                                                },
                                                child: Container(
                                                  height: 60,
                                                  width: double.infinity,
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      //schedule id
                                                      CircleAvatar(
                                                          radius: 20,
                                                          child: Text(snapshot1
                                                              .data!
                                                              .data![index]
                                                              .scheduleId
                                                              .toString())),
                                                      SizedBox(
                                                        width: 10,
                                                      ),

                                                      Container(
                                                        height: 60,
                                                        width: 250,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                // color: Colors.grey.withOpacity(0.5),
                                                                color: Colors
                                                                    .blue
                                                                    .withOpacity(
                                                                        0.3)),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        // starting time and ending time

                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${snapshot1.data!.data![index].startTime.toString()}' +
                                                                  '  -  ' +
                                                                  '${snapshot1.data!.data![index].endTime.toString()}',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),

                                                            //  price
                                                            Text(
                                                              'Rs ' +
                                                                  snapshot1
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .price
                                                                      .toString(),
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else if (snapshot1.data!.data![index]
                                                .bookingStatus ==
                                            'Not-Booked') {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AreaBookingInfoScreen(
                                                          focusDay: focusedDay,
                                                          model1: widget.model1,
                                                          schedule: snapshot1
                                                              .data!
                                                              .data![index],
                                                          ground: snapshot.data!
                                                              .userData![0],
                                                        ),
                                                      ),
                                                    );

                                                    print(snapshot1.data!
                                                        .data![index].scheduleId
                                                        .toString());
                                                    print(snapshot1
                                                        .data!
                                                        .data![index]
                                                        .bookingStatus
                                                        .toString());
                                                    print(focusedDay);
                                                  }
                                                },
                                                child: Container(
                                                  height: 60,
                                                  width: double.infinity,
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      //schedule id
                                                      CircleAvatar(
                                                          radius: 20,
                                                          child: Text(snapshot1
                                                              .data!
                                                              .data![index]
                                                              .scheduleId
                                                              .toString())),
                                                      SizedBox(
                                                        width: 10,
                                                      ),

                                                      Container(
                                                        height: 60,
                                                        width: 250,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                // color: Colors.grey.withOpacity(0.5),
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.3)),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        // starting time and ending time

                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${snapshot1.data!.data![index].startTime.toString()}' +
                                                                  '  -  ' +
                                                                  '${snapshot1.data!.data![index].endTime.toString()}',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),

                                                            //  price
                                                            Text(
                                                              'Rs ' +
                                                                  snapshot1
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .price
                                                                      .toString(),
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );
                                  } else if (snapshot1.hasError) {
                                    return Center(
                                        child: Text('No Schedule found'));
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
