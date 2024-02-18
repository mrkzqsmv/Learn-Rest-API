import 'package:flutter/material.dart';
import 'package:learn_rest_api/providers/postProvider.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getPost();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: postProvider.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          postProvider.postData.id.toString(),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Text(
                        postProvider.postData.body ?? "",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )),
      ),
    );
  }
}
