import 'package:flutter/material.dart';

import '../examples/dataset.dart';
import '../views/dataset_table_view.dart';


class DataSetListScreen extends StatelessWidget {
  const DataSetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据集列表'),
      ),
      body: SingleChildScrollView(
        child: DataSetTableView(datasetList: exampleDataSetList),
      ),
    );
  }
}
