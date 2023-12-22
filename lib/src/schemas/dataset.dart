/// 数据集

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dataset.freezed.dart';
part 'dataset.g.dart';

@freezed
class DataSet with _$DataSet {
  factory DataSet({
    required String id,
    required String name,
    required String? verboseName,
    required String? description,
  }) = _DataSet;

  factory DataSet.fromJson(Map<String, dynamic> json) => _$DataSetFromJson(json);
}
