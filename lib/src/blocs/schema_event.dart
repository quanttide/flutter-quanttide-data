part of 'schema_bloc.dart';

@immutable
abstract class DataSchemaEvent {}

class DataSchemaRetrieved extends DataSchemaEvent {}

class DataSchemaCreated extends DataSchemaEvent {}

class DataSchemaUpdated extends DataSchemaEvent {}

class DataSchemaDeleted extends DataSchemaEvent {}

class DataSchemaListed extends DataSchemaEvent {}
