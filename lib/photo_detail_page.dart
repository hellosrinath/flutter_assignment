import 'package:cart_ui_assignment/product.dart';
import 'package:flutter/material.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoModel photoModel =
        ModalRoute.of(context)!.settings.arguments as PhotoModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              photoModel.url,
              width: 400,
              height: 400,
            ),
            Text('Title: ${photoModel.title}'),
            Text('id: ${photoModel.id}'),
          ],
        ),
      ),
    );
  }
}
