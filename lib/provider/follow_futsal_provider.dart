// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:futsal/data/repository/post/follow_futsal_repo.dart';

class FollowFutsalProvider extends ChangeNotifier {
  bool _isclicked = false;
  bool get isclicked => _isclicked;
  String _Pvalue = 'follow';
  String _Svalue = 'unfollow';
  String get Pvalue => _Pvalue;
  String get Svalue => _Svalue;


  void onchange() {
    _isclicked = !_isclicked;
   
    notifyListeners();
  }
      void followFutsalprovider(
          {required BuildContext context,
          required String futsal_id,
          required String user_id}) {
        FollowFutsalRepo().followFutsalRepo(
            futsal_id: futsal_id, user_id: user_id, context: context);
    notifyListeners();

      }
      void unfollowFutsalprovider(
          {required BuildContext context,
          required String futsal_id,
          required String user_id}) {
        FollowFutsalRepo().unfollowFutsalRepo(
            futsal_id: futsal_id, user_id: user_id, context: context);
    notifyListeners();

  }
}
