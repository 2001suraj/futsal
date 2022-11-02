// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:futsal/data/model/followed_futsal_list_model.dart';



import 'package:futsal/provider/follow_futsal_provider.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:futsal/view/base_widget/futsal_service_list.dart';

import 'package:futsal/view/screen/favorities_screen/components/book_a_match_follow_futsal.dart';
import 'package:futsal/view/screen/favorities_screen/components/reports_follow_futsal.dart';

import 'package:futsal/view/screen/home_screen/components/home_slider/components/venue_rules_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SingelHomeFutsalFollowSliderPage extends StatelessWidget {
  FollowedFutsalListDataModel model1;

  SingelHomeFutsalFollowSliderPage({Key? key, required this.model1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FollowFutsalProvider followFutsalProvider =
        Provider.of<FollowFutsalProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Container(
                    //   height: 400,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: NetworkImage(
                    //         model1.logo.toString(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_sharp)),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //futsal name
                      Text(
                        model1.futsalName.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ), //futsal location
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 40,
                              child: Text(
                                model1.address.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            followFutsalProvider.isclicked
                                ? TextButton(
                                    onPressed: () {
                                      followFutsalProvider.onchange();
                                      followFutsalProvider.followFutsalprovider(
                                          context: context,
                                          futsal_id: model1.id.toString(),
                                          user_id: value.user()!.id.toString());
                                    },
                                    child: Text(
                                      followFutsalProvider.Pvalue,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      followFutsalProvider.onchange();
                                      followFutsalProvider
                                          .unfollowFutsalprovider(
                                              context: context,
                                              futsal_id: model1.id.toString(),
                                              user_id:
                                                  value.user()!.id.toString());
                                    },
                                    child: Text(
                                      followFutsalProvider.Svalue,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      //services
                      Text(
                        'Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),

                      futsal_service_list(),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      //location
                      Text(
                        'Location',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //map
                      Container(
                        // margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),

                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black)),
                        child: GoogleMap(
                          //  markers: Set<Marker>.of(marker),
                          markers: <Marker>{
                            Marker(
                                markerId: MarkerId('1'),
                                position: LatLng(double.parse(model1.lat!),
                                    double.parse(model1.lon!)),
                                infoWindow:
                                    InfoWindow(title: model1.futsalName))
                          },

                          initialCameraPosition: CameraPosition(
                            zoom: 15,
                            target: LatLng(double.parse(model1.lat!),
                                double.parse(model1.lon!)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //rules
                      Text(
                        'Venue Rules',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 270,
                            height: 40,
                            child: Text(
                              'Players are requested to be present at the venue 15 minutes prior to their booking',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, VenueRuleScreen.routeName);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //report this futsal
                      ReportFollowFutsalWidget(model1:model1),

                    
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 30,
        width: 200,
        child: Consumer<LoginProvider>(
          builder: (context, value, child) => FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Text('Book a Match'), //child widget inside this button
            shape: BeveledRectangleBorder(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BooKAMatchFollowFutsalScreen(
                            model1: model1,
                          )));
              //task to execute when this button is pressed
            },
          ),
        ),
      ),
    );
  }
}
