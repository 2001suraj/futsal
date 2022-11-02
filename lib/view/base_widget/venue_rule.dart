// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:futsal/data/model/venue_rule_model.dart';

import 'package:futsal/data/repository/get/venue_rules_repo.dart';

Expanded venue_rule() {
  return Expanded(
    child: FutureBuilder<VenueRuleModel>(
      future: VenuRuleRepo().venuRuleRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.only(left: 40, right: 30, bottom: 10, top: 5),
            height: 350,
            child: Html(
              data: snapshot.data!.userData!.rules.toString(),
              style: {
                'li': Style(
                  color: Colors.black,
                   fontSize: FontSize.large,
                  lineHeight: LineHeight.percent(150),
                ),
                
              },
            ),
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
