// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class EventSinglePage extends StatelessWidget {
  EventSinglePage({
    Key? key,
    required this.eventSlider,
  }) : super(key: key);
  EventSlider eventSlider;

  @override
  Widget build(BuildContext context) {
    bool readmore = true;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  eventSlider.title.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              //organizer venue email phone number
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.lightBlueAccent,
                            offset: Offset(0, 0),
                            blurRadius: 7)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customRow(
                        text: 'Organizer   :',
                        text1: eventSlider.organizer.toString(),
                      ),
                      customRow(
                        text: 'Venue  : ',
                        text1: eventSlider.venue.toString(),
                      ),
                      customRow(
                        text: 'email     :  ',
                        text1: eventSlider.email.toString(),
                      ),
                      customRow(
                        text: 'Phone number  : ',
                        text1: eventSlider.contactNumber.toString(),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),

              //map
              Container(
                margin: EdgeInsets.all(20),
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
                        position: LatLng(double.parse(eventSlider.lat!),
                            double.parse(eventSlider.lon!)),
                        infoWindow: InfoWindow(title: eventSlider.title))
                  },

                  initialCameraPosition: CameraPosition(
                    zoom: 15,
                    target: LatLng(double.parse(eventSlider.lat!),
                        double.parse(eventSlider.lon!)),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // height: 250,

                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.lightBlueAccent,
                          offset: Offset(0, 0),
                          blurRadius: 7)
                    ]),
                child: Html(
                    data: eventSlider.description,
                    shrinkWrap: true,
                    style: {
                      'p': Style(
                        color: Colors.blueGrey,
                       
                      )
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding customRow({required String text, required String text1}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 14),
      child: SizedBox(
        width: 250,
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.,
          children: [
            Text(
              text,
              maxLines: 1,
               overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text1,
              maxLines: 1,
              overflow:  TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
