// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/data/repository/get/near_by_futsal_list_repo.dart';

Expanded nearby_futsal_list() {
  return Expanded(
     flex:  1,

      child: FutureBuilder<NearByFutaslListModel>(
        future: NearByFutsalListRepo().nearbyFutsalListrepo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 5),
                  height: 250,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  
                                snapshot.data!.data![index].logo.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        snapshot.data!.data![index].futsalName.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Text(
                          snapshot.data!.data![index].address.toString(),
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
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
}
