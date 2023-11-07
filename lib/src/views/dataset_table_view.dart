import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';


/// 数据集表格视图
class DataSetTableView extends StatelessWidget {
  /// 数据集列表
  final List<Map<String, dynamic>> datasetList;
  /// 数据集字段名称
  static const List<String> datasetFieldList = ['标识', '名称'];

  const DataSetTableView({
    super.key,
    required this.datasetList
  });

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: datasetFieldList.map(
        (field) => DataColumn(label: Text(field)),
      ).toList(),
      rows: datasetList.map((dataset) {
        return DataRow(cells: [
          DataCell(Text(dataset['name'])),
          DataCell(Text(dataset['verboseName'])),
        ]);
      }).toList(),
    );
  }
}
