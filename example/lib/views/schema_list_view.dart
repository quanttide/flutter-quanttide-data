import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSchemaListView extends StatelessWidget {
  const DataSchemaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSchemaBloc, DataSchemaState>(
      builder: (context, state) {
        if (state is DataSchemaWaiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DataSchemaListSuccess) {
          return DataSchemaListSuccessView(dataSchemaList: state.dataSchemaList);
        } else if (state is DataSchemaError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}


class DataSchemaListSuccessView extends StatelessWidget {
  final List<DataSchema> dataSchemaList;

  const DataSchemaListSuccessView({super.key, required this.dataSchemaList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataSchemaList.length,
      itemBuilder: (context, index) {
        DataSchema dataSchema = dataSchemaList[index];
        return ListTile(
          title: Text(dataSchema.name ?? ''),
          subtitle: Text(dataSchema.verboseName ?? ''),
          onTap: () {
            // TODO: Implement the logic for handling item tap
          },
        );
      },
    );
  }
}