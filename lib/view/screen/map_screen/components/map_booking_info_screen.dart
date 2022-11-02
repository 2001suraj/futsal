// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_ground_list_model.dart';
import 'package:futsal/data/model/futsal_schedule_model.dart';
import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/provider/futsal_booking_provider.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';

class MapBookingInfoScreen extends StatelessWidget {
  MapBookingInfoScreen(
      {Key? key,
      required this.focusDay,
      required this.schedule,
      required this.ground,
      required this.model1})
      : super(key: key);
  FutsalScheduleDataModel schedule;
  FutsalGroundListDataModel ground;
  NearByFutaslDataListModel model1;
  DateTime focusDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Text(
          'Booking Info ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //booking info
                _customTitleText('Booking Info'),
                SizedBox(
                  height: 5,
                ),
                cusotmSubText('Confirm  your booking and payment details'),
                SizedBox(
                  height: 5,
                ),
                Divider(color: Colors.blueGrey, thickness: 1),

                //time info
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _customTitleText('Time Info'),
                          SizedBox(
                            height: 5,
                          ),
                          cusotmSubText(
                              '${schedule.startTime} - ${schedule.endTime}'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(color: Colors.blueGrey, thickness: 1),
                SizedBox(
                  height: 5,
                ),
                //futsal match mode
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _customTitleText('Futsal Match Mode'),
                          SizedBox(
                            height: 5,
                          ),
                          cusotmSubText(ground.groundName),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.blueGrey, thickness: 0.5),
                Divider(color: Colors.blueGrey, thickness: 0.5),

                //redeem your coupons
                Row(
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _customTitleText('Redeem your coupons'),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Colors.green[200],
                            height: 30,
                            width: 320,
                            child: Center(
                                child: Text(
                                    'If you have any offer coupons eg. #FC514CA')),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.grey.withOpacity(0.5),
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'To Pay (1 hour) ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Offers Discount'),
                            Text('Coupon Discount'),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Rs. 1200',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rs.0.00 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' ------- ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                _customTitleText('More Details'),
                SizedBox(
                  height: 35,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your game in this Venue ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Our futsal providers a free games after 10 games ',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.5)),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. 1200 ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              MaterialButton(
                color: Colors.orange,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Your booking Details'),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futsal Name   :' + '   ${model1.futsalName}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Address   :' '   ${model1.address}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Ground   :' '   ${ground.groundName}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Time   :'
                                '   ${schedule.startTime}'
                                '-'
                                '${schedule.endTime}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price    :',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(' Rs .${schedule.price}',
                                      style: TextStyle(
                                        color: Colors.red[200],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Choose a Payment Options : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Consumer<LoginProvider>(
                                builder: (context, value, child) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MaterialButton(
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        FutsalBookingProvider().booking(
                                            schedule:
                                                schedule.scheduleId.toString(),
                                            user_id:
                                                value.user()!.id.toString(),
                                            booking_date: focusDay.toString(),
                                            payment_detail:
                                                '[{"payment_type_id": 1, "amount": 1000},  {"payment_type_id": 2, "amount": 200}]',
                                            context: context);
                                        print('hello');
                                        print(schedule.scheduleId.toString());
                                        print(focusDay);
                                      },
                                      child: Text('Cash At Venue'),
                                    ),
                                    Image.asset(
                                      'assets/images/esewa.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      );
                    },
                  );
                },
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text cusotmSubText(text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Text _customTitleText(text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
