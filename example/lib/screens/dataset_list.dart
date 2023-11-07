import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';

import '../examples/dataset.dart';


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


/// 数据集表格视图
class DataSetTableView extends StatelessWidget {
  /// 数据集列表
  final List<Map<String, dynamic>> datasetList;

  const DataSetTableView({
    super.key,
    required this.datasetList
  });

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: const [
        DataColumn(label: Text('标识')),
        DataColumn(label: Text('名称')),
      ],
      rows: datasetList.map((dataset) {
        return DataRow(cells: [
          DataCell(Text(dataset['name'])),
          DataCell(Text(dataset['verboseName'])),
        ]);
      }).toList(),
    );
  }
}
