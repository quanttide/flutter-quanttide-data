/// 数据集表格视图

import 'package:flutter/material.dart';

import '../schemas/dataset.dart';


class DataSetTableView extends StatelessWidget {
  final List<DataSet> datasetList = [
    DataSet(name: 'universities', description: '高校及其院系列表', verboseName: '高校数据集', id: '1'),
    DataSet(name: 'weibo', description: '上市公司微博简介', verboseName: '微博数据集', id: '2'),
    DataSet(name: 'university-fellows', description: '高校教师简历', verboseName: "高校教师数据集", id: '3'),
  ];

  DataSetTableView({super.key, required datasetList});

  @override
  Widget build(BuildContext context) {
    final List<String> columns = ["标识", '名称', '描述'];
    return DataTable(
      // minWidth: 600,
      columns: List.generate(
        datasetList.length,
          (index) => DataColumn(label: Text(columns[index])),
      ),
      rows: List.generate(
        datasetList.length,
            (index) =>
            DataRow(
              cells: [
                DataCell(Text(datasetList[index].name)),
                DataCell(Text(datasetList[index].verboseName!)),
                DataCell(Text(datasetList[index].description!)),
              ],
            ),
      ),
    );
  }
}
