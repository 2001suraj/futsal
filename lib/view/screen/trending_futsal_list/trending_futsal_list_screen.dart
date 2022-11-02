import 'package:flutter/material.dart';
import 'package:futsal/data/model/home_slider_model.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';

import 'package:futsal/view/screen/home_screen/components/home_slider/components/home_slider_single_page.dart';

class Trending_Futsal_list_screen extends StatelessWidget {
  static const String routeName = '/futsal_by_area';
  Trending_Futsal_list_screen({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Trending Futsal"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height:MediaQuery.of(context).size.height *0.85,
                  width: MediaQuery.of(context).size.width,
               child: FutureBuilder<HomeSliderModel>(
                      future: HomSliderRepo().homSliderRepo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            itemCount: snapshot.data!.data!.futsalSlider!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  
                                    Container(
                                            // width: 155,
                                            height: 124,
                                            padding:EdgeInsets.all(10),
                                            margin: EdgeInsets.all(20),
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
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 18),
                                            child: Text(snapshot.data!.data!.futsalSlider![index].futsalName.toString(),maxLines: 1,overflow: TextOverflow.ellipsis
                                            ,),
                                          ),
                                  ],
                                ),
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


              ],
            ),
          ),
        ),
      ),
    );
  }
}
