import 'dart:async';

import '../schemas/schema.dart';
import '../providers/api.dart';


class DataSchemaRepository {
  final ApiService apiService;

  DataSchemaRepository({required this.apiService});

  Future<List<DataSchema>> listDataSchemas() async {
    try {
      // Make API call to fetch data schemas
      final data = await apiService.listDataSchemas();

      // Convert API response to a list of DataSchema objects
      final List<DataSchema> dataSchemas = data.map((item) => DataSchema.fromJson(item)).toList();

      return dataSchemas;
    } catch (e) {
      throw Exception('Failed to fetch data schemas: $e');
    }
  }

  Future<DataSchema> retrieveDataSchema(String id) async {
    try {
      // Make API call to fetch data schema by ID
      final data = await apiService.retrieveDataSchema(id);

      // Convert API response to a DataSchema object
      final DataSchema dataSchema = DataSchema.fromJson(data);

      return dataSchema;
    } catch (e) {
      throw Exception('Failed to fetch data schema: $e');
    }
  }

  Future<void> saveDataSchema(DataSchema dataSchema) async {
    try {
      // Convert DataSchema object to JSON
      final jsonData = dataSchema.toJson();

      // Make API call to save data schema
      await apiService.saveDataSchema(jsonData);
    } catch (e) {
      throw Exception('Failed to save data schema: $e');
    }
  }

  Future<void> deleteDataSchema(String id) async {
    try {
      // Make API call to delete data schema by ID
      await apiService.destroyDataSchema(id);
    } catch (e) {
      throw Exception('Failed to delete data schema: $e');
    }
  }
}

