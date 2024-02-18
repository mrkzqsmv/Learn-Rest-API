import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_rest_api/models/albumModel.dart';

class AlbumServices {
  String baseURL = 'https://jsonplaceholder.typicode.com/photos/1';

  Future<AlbumModel> getAlbum() async {
    late AlbumModel albumData;

    try {
      final response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        albumData = AlbumModel.fromJson(item);
      } else {
        debugPrint('Error Occured');
      }
    } catch (e) {
      debugPrint('Error Occured $e');
    }
    return albumData;
  }
}
