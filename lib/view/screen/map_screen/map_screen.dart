// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/data/repository/get/near_by_futsal_list_repo.dart';
import 'package:futsal/view/screen/drawer/drawer_screen.dart';
import 'package:futsal/view/screen/map_screen/components/map_single_page.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);
  static const double lat = 27.7172;
  static const double log = 85.3240;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition defaultlocation =
      CameraPosition(target: LatLng(MapScreen.lat, MapScreen.log), zoom: 12.5);

  MapType currnetMap = MapType.normal;
  void changeMapType() {
    setState(() {
      currnetMap =
          currnetMap == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }






  @override
  void initState() {
    super.initState();

    // marker.addAll(lists);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Futsal Sansar'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      drawer: CustomDrawer(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<NearByFutaslListModel>(
          future: NearByFutsalListRepo().nearbyFutsalListrepo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                          mapType: currnetMap,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          compassEnabled: true,
                          initialCameraPosition: defaultlocation,
                          markers: {
                            for (int i = 0;
                                i < snapshot.data!.data!.length;
                                // i < 30;

        
        
                                i++)

                                

                              
                              
                              Marker(

                                

                                markerId: MarkerId(
                                    snapshot.data!.data![i].id.toString()),
                                position: LatLng(
                                    double.parse(
                                        snapshot.data!.data![i].lat.toString()),
                                    double.parse(snapshot.data!.data![i].lon
                                        .toString())),
                                infoWindow: InfoWindow(
                                    title: snapshot.data!.data![i].futsalName,
                                    snippet: snapshot.data!.data![i].address,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapSinglePage(
                                                      model1: snapshot
                                                          .data!.data![i])));
                                    }),
                              ),
                          }),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
