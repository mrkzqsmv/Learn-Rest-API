import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_rest_api/models/postModel.dart';

class PostServices {
  String baseURL = 'https://jsonplaceholder.typicode.com/comments/2';
  Future<PostModel> getPost() async {
    late PostModel postData;
    try {
      final response = await http.get(
        Uri.parse(baseURL),
      );
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        postData = PostModel.fromJson(item);
      } else {
        debugPrint('Error Occured');
      }
    } catch (e) {
      debugPrint('Error Occured $e');
    }
    return postData;
  }
}
