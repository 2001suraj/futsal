// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:futsal/view/base_widget/venue_rule.dart';

class VenueRuleScreen extends StatelessWidget {
  static const String routeName = '/Venue_Rules_screen';
  const VenueRuleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_sharp)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0, vertical :10,),
              child: Text('Venue Rules',style: TextStyle(fontWeight: FontWeight.bold, fontSize:  25),),
            ),
            venue_rule()
          ]),
        ),
      ),
    );
  }
}
