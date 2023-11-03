part of 'schema_bloc.dart';

@immutable
abstract class DataSchemaState {}

class DataSchemaInitial extends DataSchemaState {}

class DataSchemaWaiting extends DataSchemaState {}

class DataSchemaError extends DataSchemaState {
  final String message;
  
  DataSchemaError(this.message);
}

class DataSchemaDetailSuccess extends DataSchemaState {
  final DataSchema dataSchema;

  DataSchemaDetailSuccess(this.dataSchema);
}

class DataSchemaListSuccess extends DataSchemaState {
  final List<DataSchema> dataSchemaList;

  DataSchemaListSuccess(this.dataSchemaList);
}
