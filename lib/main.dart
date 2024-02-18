import 'package:flutter/material.dart';
import 'package:learn_rest_api/providers/albumProvider.dart';
import 'package:learn_rest_api/providers/postProvider.dart';
import 'package:learn_rest_api/views/screens/albumsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
        ChangeNotifierProvider<AlbumProvider>(create: (_) => AlbumProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlbumsScreen(),
    );
  }
}
