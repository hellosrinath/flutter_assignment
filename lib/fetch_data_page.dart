import 'dart:convert';

import 'package:cart_ui_assignment/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  late List<PhotoModel> photoModelList = [];

  @override
  void initState() {
    super.initState();
    fetchPhotosFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
        backgroundColor: Colors.blue,
      ),
      body: photoModelList.isNotEmpty
          ? ListView.builder(
              itemCount: photoModelList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/photo-details',
                              arguments: photoModelList[index]);
                        },
                        child: Image.network(
                          photoModelList[index].thumbnailUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(photoModelList[index].title),
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<void> fetchPhotosFromApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      debugPrint('response: $data');
      setState(() {
        photoModelList = data.map((e) => PhotoModel.fromJson(e)).toList();
        debugPrint('response: ${photoModelList.length}');
      });
    } else {
      throw Exception('Failed to load photo data');
    }
  }
}
