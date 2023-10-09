import 'package:flutter/material.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


/// 数据表单页面
class DataFormScreen extends StatelessWidget {
  const DataFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据表单页面', textAlign: TextAlign.center,),
        centerTitle: true,
      ),

      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: DataFormView(fields: [])
      ),
    );
  }
}
