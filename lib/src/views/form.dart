import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


/// 数据表单视图
class DataFormView extends StatelessWidget {
  /// 字段列表
  final List<Map<String, dynamic>> fields;

  const DataFormView({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        child: Column(
          children: [
            ...fields.map(
                    (Map<String, dynamic> field){
                  return FormBuilderTextField(
                    name: field['name'],
                    decoration: InputDecoration(labelText: field['hint']),
                  );
                }
            ).toList(),
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: const Text('提交', style: TextStyle(fontSize: 16))
                  ),
                  TextButton(
                      onPressed: (){},
                      child: const Text('取消', style: TextStyle(fontSize: 16))
                  )
                ]
            )
          ],
        )
    );
  }
}
