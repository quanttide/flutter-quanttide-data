import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSetDetailScreen extends StatelessWidget {
  const DataSetDetailScreen({super.key});

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


class DataSetView extends StatelessWidget {
  const DataSetView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


class DataSchemaTableView extends StatelessWidget {
  const DataSchemaTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSchemaBloc, DataSchemaState>(
      builder: (context, state) {
        if (state is DataSchemaWaiting) {
          return buildWaiting(context);
        } else if (state is DataSchemaListSuccess) {
          return buildSuccess(
              context,
              dataSchemaList: state.dataSchemaList
          );
        } else if (state is DataSchemaError) {
          return buildError(context, message: state.message);
        } else {
          return buildError(context, message: 'Unknown state');
        }
      },
    );
  }

  Widget buildSuccess(BuildContext context, {required dataSchemaList}) {
    return DataTable2(
      columns: const [
        DataColumn(label: Text('标识')),
        DataColumn(label: Text('名称')),
      ],
      rows: dataSchemaList.map((dataset) {
        return DataRow(cells: [
          DataCell(Text(dataset['name'])),
          DataCell(Text(dataset['verboseName'])),
        ]);
      }).toList(),
    );
  }

  Widget buildWaiting(BuildContext context){
    return const Center(
        child: CircularProgressIndicator()
    );
  }

  Widget buildError(BuildContext context, {required message}){
    return Center(
      child: Text('Error: $message'),
    );
  }
}