import 'package:flutter/material.dart';
import 'package:provider_state_management/API-Calls-Provider/service_class.dart';

import 'model/data_model.dart';

class DataClass extends ChangeNotifier
{
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = await getSinglePostData();
    loading = false;

    notifyListeners();
  }
}