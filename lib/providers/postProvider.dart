import 'package:flutter/material.dart';
import 'package:learn_rest_api/models/postModel.dart';
import '../services/postService.dart';

class PostProvider with ChangeNotifier {
  late PostModel postData;

  bool loading = false;
  PostServices services = PostServices();

  getPost() async {
    loading = true;
    postData = await (services.getPost());
    loading = false;
    notifyListeners();
  }
}
