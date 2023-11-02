import 'package:flutter/material.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSchemaScreen extends StatefulWidget {
  const DataSchemaScreen({super.key});

  @override
  _DataSchemaScreenState createState() => _DataSchemaScreenState();
}

class _DataSchemaScreenState extends State<DataSchemaScreen> {
  DataSchema _dataSchema = const DataSchema(
    id: '1',
    name: 'Schema 1',
    verboseName: 'Schema One',
    readme: 'This is the first schema.',
    type: 'Type A',
  );

  void _updateDataSchema(DataSchema newDataSchema) {
    setState(() {
      _dataSchema = newDataSchema;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据模型表单'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DataSchemaDetailForm(
          dataSchema: _dataSchema
        ),
      ),
    );
  }
}