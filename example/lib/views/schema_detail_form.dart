import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


class DataSchemaDetailForm extends StatelessWidget {
  final DataSchema dataSchema;

  const DataSchemaDetailForm({Key? key, required this.dataSchema}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      initialValue: {
        'id': dataSchema.id,
        'name': dataSchema.name,
        'verboseName': dataSchema.verboseName,
        'readme': dataSchema.readme,
        'type': dataSchema.type,
      },
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'id',
            decoration: const InputDecoration(labelText: 'ID'),
          ),
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(labelText: '标识'),
          ),
          FormBuilderTextField(
            name: 'verboseName',
            decoration: const InputDecoration(labelText: '名称'),
          ),
          FormBuilderTextField(
            name: 'readme',
            decoration: const InputDecoration(labelText: '简介'),
          ),
          FormBuilderTextField(
            name: 'type',
            decoration: const InputDecoration(labelText: '类型'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('提交', style: TextStyle(fontSize: 16)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('取消', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}