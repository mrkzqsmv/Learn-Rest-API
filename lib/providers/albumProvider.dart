import 'package:flutter/material.dart';
import 'package:learn_rest_api/models/albumModel.dart';
import 'package:learn_rest_api/services/albumService.dart';

class AlbumProvider with ChangeNotifier {
  late AlbumModel albumData;

  bool loading = false;
  AlbumServices service = AlbumServices();

  getAlbum() async {
    loading = true;
    albumData = await (service.getAlbum());
    loading = false;
    notifyListeners();
  }
}
