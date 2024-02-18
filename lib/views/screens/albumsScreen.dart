import 'package:flutter/material.dart';
import 'package:learn_rest_api/providers/albumProvider.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AlbumProvider>(context, listen: false).getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final albumProvider = Provider.of<AlbumProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: albumProvider.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        albumProvider.albumData.title.toString(),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Text(
                      albumProvider.albumData.url ?? "",
                      textAlign: TextAlign.justify,
                    ),
                    Image.network(albumProvider.albumData.url.toString())
                  ],
                ),
        ),
      ),
    );
  }
}
