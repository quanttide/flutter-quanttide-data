import 'package:flutter/material.dart';

import '../views/schema_list_view.dart';


class DataSetDetailScreen extends StatelessWidget {
  const DataSetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据集页面'),
      ),
      body: const DataSchemaListView(),
    );
  }
}
