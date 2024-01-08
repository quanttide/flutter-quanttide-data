part of 'schema_bloc.dart';


sealed class DataSchemaState extends Equatable {
  const DataSchemaState();

  @override
  List<Object?> get props => [];
}


class DataSchemaInitial extends DataSchemaState {}

class DataSchemaWaiting extends DataSchemaState {}

class DataSchemaError extends DataSchemaState {
  final String message;

  const DataSchemaError(this.message);

  @override
  List<Object?> get props => [message];
}

class DataSchemaDetailSuccess extends DataSchemaState {
  final DataSchema dataSchema;

  const DataSchemaDetailSuccess(this.dataSchema);

  @override
  List<Object?> get props => [dataSchema];
}

class DataSchemaListSuccess extends DataSchemaState {
  final List<DataSchema> dataSchemaList;

  const DataSchemaListSuccess(this.dataSchemaList);

  @override
  List<Object?> get props => [dataSchemaList];
}