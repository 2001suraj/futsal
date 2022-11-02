// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:futsal/view/base_widget/user_booked_futsal_list.dart';

class MyBookingList extends StatefulWidget {
  static const String RouteName = '/MyBookingList';
  const MyBookingList({Key? key}) : super(key: key);

  @override
  State<MyBookingList> createState() => _MyBookingListState();
}

class _MyBookingListState extends State<MyBookingList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
             indicatorColor: Colors.orangeAccent,
              tabs: [
                Tab(child: Text('PENDING', style: TextStyle(letterSpacing: 2,color: Colors.grey),),),
                Tab(child: Text('COMPLETED', style: TextStyle(letterSpacing: 2,color: Colors.grey),),),

              ],
            ),
          backgroundColor: Colors.white,
           elevation: 0,
          iconTheme: IconThemeData(color:Colors.black),
          title: Text(
            'Booking List',
            style: TextStyle(
              letterSpacing: 1.3,
              color: Colors.orangeAccent,
            ),
          ),
        ),
       
        body: TabBarView(
            children: [
              user_booked_futsal_list(status: 'Pending'),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('No data Available', textAlign: TextAlign.center,
                style: TextStyle(fontWeight:  FontWeight.bold, fontSize: 20, color: Colors.orange),),
              ),
            ],
          ),
      ),
    );
  }
}
