import 'package:flutter/material.dart';


class DataSchemaDetailScreen extends StatelessWidget {
  final String title = '';
  final String description = '';
  final String imageUrl = '';

  const DataSchemaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200.0,
            width: 200.0,
            child: Image.network(imageUrl),
          ),
          Text(description),
        ],
      ),
    );
  }
}
