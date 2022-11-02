// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:futsal/data/model/followed_futsal_list_model.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/followed_futsal_list_repo.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:futsal/view/screen/favorities_screen/components/singlehome_slider_futsal_followed.dart';

import 'package:provider/provider.dart';


class FavirotiesScreen extends StatelessWidget {
  const FavirotiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fustal Followed'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Consumer<LoginProvider>(
                  builder: (context, value, child) => 
                   Container(
                    // height: double.maxFinite,
                    width: double.infinity,
                    child: FutureBuilder<FollowedFutsalListModel>(
                      future: FollowedFutsalListRepo().followedFutsalListRepo(userid: value.user()!.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              width: double.infinity,
                              child: FutureBuilder<HomeSliderModel>(
                                future: HomSliderRepo().homSliderRepo(),
                                builder: (context, snapshot1) {
                                  if (snapshot1.hasData) {
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: snapshot.data!.data!.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SingelHomeFutsalFollowSliderPage(
                                                            model1: snapshot.data!.data![index],
                                                          )
                                                          ));
                                            },
                                            child: Container(
                                                height: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.grey.withOpacity(0.4)),
                                                width: double.infinity,
                                                padding: EdgeInsets.all(15),
                                                margin: EdgeInsets.all(15),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                
                                                        // fit: BoxFit.contain
                                                      ),
                
                                                      // child: Image(
                                                      //   image: NetworkImage(
                                                      //       '${snapshot.data!.data![index].logo}'),
                                                      // ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          //futsal name
                                                          Text(
                                                            '${snapshot.data!.data![index].futsalName.toString()}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.orangeAccent,
                                                                   fontSize: 18
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          SizedBox(height: 10,),
                                                          //address
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .address
                                                                .toString(),
                                                                 maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          //status
                                                          Text(
                                                            'Status  :  ' +
                                                                snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .status
                                                                    .toString(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ));
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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
