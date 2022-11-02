import 'package:flutter/material.dart';
import 'package:futsal/view/base_widget/futsal_by_area.dart';

class FutsalByAreaScreen extends StatelessWidget {
  static const String routeName = '/futsal_by_area';
  FutsalByAreaScreen({Key? key, required this.area_id, required this.area_name}) : super(key: key);
  String area_id;
  String area_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(area_name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: futsal_by_area(area_id: area_id))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
