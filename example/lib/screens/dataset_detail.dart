import 'package:flutter/material.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSetScreen extends StatelessWidget {
  const DataSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据集页面'),
      ),
      body: const Column(
        children: [
          DataSetView(),
          DataSchemaTableView()
        ]
      ),
    );
  }
}





