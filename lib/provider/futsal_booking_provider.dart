// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:futsal/data/repository/post/futsal_booking_repo.dart';
// import 'package:provider/provider.dart';

// import '../data/model/payment_type_model.dart';
// import 'login_provider.dart';

class FutsalBookingProvider extends ChangeNotifier {
  void booking({
    required String schedule,
    required String user_id,
    required String booking_date,
    // required List<Map<String, dynamic>> payment_detail,
    required String payment_detail,



    required BuildContext context,
  }) {
    FutsalBookingRepo().futsalBookingRepo(
        schedule_id: schedule,
        user_id: user_id,
        booking_date: booking_date,
        payment_detail: payment_detail,
        context: context);

  }
}
