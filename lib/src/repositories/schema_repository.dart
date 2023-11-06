import 'dart:async';

import '../schemas/schema.dart';
import '../providers/api.dart';


class DataSchemaRepository {
  final ApiClient apiClient;

  DataSchemaRepository({required this.apiClient});

  Future<List<DataSchema>> listDataSchemas() async {
    try {
      // Make API call to fetch data schemas
      final data = await apiClient.listDataSchemas();

      // Convert API response to a list of DataSchema objects
      final List<DataSchema> dataSchemas = (data).map((item) => DataSchema.fromJson(item)).toList();

      return dataSchemas;
    } catch (e) {
      throw Exception('Failed to list data schemas: $e');
    }
  }

  Future<DataSchema> retrieveDataSchema(String name) async {
    try {
      // Make API call to fetch data schema by ID
      final data = await apiClient.request(httpMethod: 'GET', apiPath: '/schemas/$name');

      // Convert API response to a DataSchema object
      final DataSchema dataSchema = DataSchema.fromJson(data);

      return dataSchema;
    } catch (e) {
      throw Exception('Failed to fetch data schema: $e');
    }
  }

  Future<void> createDataSchema(DataSchema dataSchema) async {
    try {
      // Convert DataSchema object to JSON
      final jsonData = dataSchema.toJson();

      // Make API call to save data schema
      await apiClient.createDataSchema(jsonData);
    } catch (e) {
      throw Exception('Failed to save data schema: $e');
    }
  }

  Future<void> deleteDataSchema(String name) async {
    try {
      // Make API call to delete data schema by ID
      await apiClient.request(httpMethod: 'DELETE', apiPath: '/schemas/$name');
    } catch (e) {
      throw Exception('Failed to delete data schema: $e');
    }
  }
}
