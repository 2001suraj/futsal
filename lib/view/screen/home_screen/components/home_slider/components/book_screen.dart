// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, must_be_immutable, avoid_print

// import 'package:esewa_pnp/esewa.dart';
// import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_ground_list_model.dart';
import 'package:futsal/data/model/futsal_schedule_model.dart';
import 'package:futsal/data/model/home_slider_model.dart';

import 'package:futsal/provider/futsal_booking_provider.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';


class BookingInfoScreen extends StatefulWidget {
  BookingInfoScreen(
      {Key? key,
      required this.focusDay,
      required this.schedule,
      required this.ground,
      required this.model1})
      : super(key: key);
  FutsalScheduleDataModel schedule;
  FutsalGroundListDataModel ground;

  FutsalSliderModel1 model1;

  DateTime focusDay;

  @override
  State<BookingInfoScreen> createState() => _BookingInfoScreenState();
}

class _BookingInfoScreenState extends State<BookingInfoScreen> {
  ESewaPnp? _esewaPnp;
  ESewaConfiguration? _configuration;
  @override
  void initState() {
    super.initState();

    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration!);
  }

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
                              '${widget.schedule.startTime} - ${widget.schedule.endTime}'),
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
                          cusotmSubText(widget.ground.groundName),
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
                                'Futsal Name   :' +
                                    '   ${widget.model1.futsalName}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Address   :' '   ${widget.model1.address}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Ground   :' '   ${widget.ground.groundName}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Time   :'
                                '   ${widget.schedule.startTime}'
                                '-'
                                '${widget.schedule.endTime}',
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
                                  Text(' Rs .${widget.schedule.price}',
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
                                            schedule: widget.schedule.scheduleId
                                                .toString(),
                                            user_id:
                                                value.user()!.id.toString(),
                                            booking_date:
                                                widget.focusDay.toString(),
                                            payment_detail:
                                                '[{"payment_type_id": 1, "amount": 1000},  {"payment_type_id": 2, "amount": 200}]',
                                            context: context);
                                        print('hello');
                                        print(widget.schedule.scheduleId
                                            .toString());
                                        print(widget.focusDay);
                                      },
                                      child: Text('Cash At Venue'),
                                    ),
                                    // MaterialButton(
                                    //   onPressed: () {
                                    //     try {
                                    //       EsewaFlutterSdk.initPayment(
                                    //         esewaConfig: EsewaConfig(
                                    //           environment: Environment.test,
                                    //           clientId: 'JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R',
                                    //           secretId: ' BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==',
                                    //         ),
                                    //         esewaPayment: EsewaPayment(
                                    //           productId: "1d71jd81",
                                    //           productName: "Product One",
                                    //           productPrice: "20",
                                    //           callbackUrl: "www.test-url.com",
                                    //         ),
                                    //         onPaymentSuccess:
                                    //             (EsewaPaymentSuccessResult
                                    //                 data) {
                                    //           debugPrint(
                                    //               ":::SUCCESS::: => $data");
                                    //         },
                                    //         onPaymentFailure: (data) {
                                    //           debugPrint(
                                    //               ":::FAILURE::: => $data");
                                    //         },
                                    //         onPaymentCancellation: (data) {
                                    //           debugPrint(
                                    //               ":::CANCELLATION::: => $data");
                                    //         },
                                    //       );
                                    //     } on Exception catch (e) {
                                    //       debugPrint(
                                    //           "EXCEPTION : ${e.toString()}");
                                    //     }
                                    //   },
                                    //   child: Text('esewa'),
                                    // )
                                    ESewaPaymentButton(
                                      _esewaPnp!,
                                      amount: 20,
                                      callBackURL: "www.test-url.com",
                                      productId: "1d71jd81",
                                      productName: "Product One",
                                      onSuccess: (result) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(result.message
                                                    .toString())));
                                      },
                                      onFailure: (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    e.message.toString())));
                                      },
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