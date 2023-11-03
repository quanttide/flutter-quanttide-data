import 'package:flutter/material.dart';

import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSchemaListScreen extends StatelessWidget {
  const DataSchemaListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据模型列表页面'),
      ),
      body: const DataSchemaListView(),
    );
  }
}
