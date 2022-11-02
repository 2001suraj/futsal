// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';

import 'package:futsal/view/base_widget/all_futsal_location.dart';

import 'package:futsal/view/base_widget/home_slider.dart';

import 'package:futsal/view/screen/drawer/drawer_screen.dart';
import 'package:futsal/view/screen/home_screen/components/event_slider/event_slider.dart';
import 'package:futsal/view/screen/home_screen/components/home_slider/components/home_slider_single_page.dart';
import 'package:futsal/view/screen/trending_futsal_list/trending_futsal_list_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/Home_Screen_Route';

  HomeScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Futsal Sansar'),
      ),
      //drawer
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.5,
            child: Column(
              children: [
                //home slider
                home_slider(),
                SizedBox(
                  height: 20,
                ),
                all_futsal_location(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Trending Futsal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Trending_Futsal_list_screen())
                        
                        );
                      }, child: Text('See All'))
                    ],
                  ),
                ),
                //futsal list home slider

                // tophomeSlider(),
                Container(
                    height: 315,
                    child: FutureBuilder<HomeSliderModel>(
                      future: HomSliderRepo().homSliderRepo(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.data!.futsalSlider!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingelHomeSliderPage(
                                                  model1: snapshot.data!.data!
                                                      .futsalSlider![index],
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 10,
                                        bottom: 10,
                                        top: 5),
                                    // height: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 155,
                                          height: 180,
                                          padding:EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .data!
                                                    .futsalSlider![index]
                                                    .logo
                                                    .toString()),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            snapshot.data!.data!
                                                .futsalSlider![index].futsalName
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: Text(
                                            snapshot.data!.data!
                                                .futsalSlider![index].address
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )),

                //event slider
                eventslider(),

                
                SizedBox(
                  height: 20,
                ),

              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
