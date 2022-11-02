// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_report_category_list.dart';

import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/data/repository/get/futsal_report_category_repo.dart';
import 'package:futsal/data/repository/post/report_futsal_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';

class MapReportsWidget extends StatelessWidget {
  MapReportsWidget({Key? key, required this.model1}) : super(key: key);
  NearByFutaslDataListModel model1;

  TextEditingController messageContrlller = TextEditingController();
 


  String? _chosenValue;
     void clearText() {
    messageContrlller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => SizedBox(
            width: 400,
            height: 320,
            child: Consumer<LoginProvider>(
              builder: (context, value, child) =>
                  FutureBuilder<FutsalReportCategoryListModel>(
                future: FutsalReportCategoryRepo().futsalReportCategoryRepo(),
                builder: (context, snapshot2) {
                  if (snapshot2.hasData) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Report your problem",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.lightBlueAccent),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          StatefulBuilder(builder: (context, setState) {
                            return DropdownButton<String>(
                              value: _chosenValue,
                              style: TextStyle(color: Colors.black),
                              items: <String>[
                                'Payment Issue',
                                'Harrasment ',
                                'Misbehaving by host',
                                'Theft of players property',
                                'Others',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Please choose your  Problem",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _chosenValue = value!;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                      content: SingleChildScrollView(
                        child: SizedBox(
                          height: 320,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 400,
                                ),
                                TextField(
                                  controller: messageContrlller,
                                  maxLines: 7,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(),
                                    alignLabelWithHint: true,
                                    label: Text('  Enter your problem'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Center(
                                    child: Container(
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.green),
                                      padding: const EdgeInsets.all(14),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            ReportFutsalRepo().reportFutsalrepo(
                                                futsal_id:
                                                    model1.id.toString(),
                                                userid:
                                                    value.user()!.id.toString(),
                                                issue_id: snapshot2
                                                    .data!.data![index].issueId
                                                    .toString(),
                                                message: messageContrlller.text,
                                                context: context);
                                          },
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
      child: Text(
        'Report This Futsal Areana',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
    );
  }
}
