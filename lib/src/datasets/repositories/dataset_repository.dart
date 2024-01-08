import 'dart:async';

import '../schemas/dataset.dart';
import 'package:flutter_quanttide_data/src/providers/api.dart';


class DataSetRepository {
  final ApiClient apiClient;

  DataSetRepository({required this.apiClient});

  Future<List<DataSet>> listDataSets() async {
    try {
      // Make API call to fetch data sets
      final data = await apiClient.request(httpMethod: 'GET', apiPath: '/datasets');

      // Convert API response to a list of DataSet objects
      final List<DataSet> dataSets = (data).map((item) => DataSet.fromJson(item)).toList();

      return dataSets;
    } catch (e) {
      throw Exception('Failed to list data sets: $e');
    }
  }

  Future<DataSet> retrieveDataSet(String id) async {
    try {
      // Make API call to fetch data set by ID
      final data = await apiClient.request(httpMethod: 'GET', apiPath: '/datasets/$id');

      // Convert API response to a DataSet object
      final DataSet dataSet = DataSet.fromJson(data);

      return dataSet;
    } catch (e) {
      throw Exception('Failed to fetch data set: $e');
    }
  }

  Future<void> createDataSet(DataSet dataSet) async {
    try {
      // Convert DataSet object to JSON
      final jsonData = dataSet.toJson();

      // Make API call to save data set
      await apiClient.request(httpMethod: "POST", apiPath: "/datasets", data: jsonData);
    } catch (e) {
      throw Exception('Failed to save data set: $e');
    }
  }

  Future<void> deleteDataSet(String id) async {
    try {
      // Make API call to delete data set by ID
      await apiClient.request(httpMethod: 'DELETE', apiPath: '/datasets/$id');
    } catch (e) {
      throw Exception('Failed to delete data set: $e');
    }
  }
}
