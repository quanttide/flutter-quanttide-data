import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../providers/api.dart';
import '../schemas/schema.dart';
import '../repositories/schema.dart';

part 'schema_event.dart';
part 'schema_state.dart';


class DataSchemaBloc extends Bloc<DataSchemaEvent, DataSchemaState> {
  final DataSchemaRepository repository = DataSchemaRepository(apiService: ApiService());

  DataSchemaBloc() : super(DataSchemaInitial()) {
    on<DataSchemaRetrieved>(_onDataSchemaRetrieved);
    on<DataSchemaCreated>(_onDataSchemaCreated);
    on<DataSchemaUpdated>(_onDataSchemaUpdated);
    on<DataSchemaDeleted>(_onDataSchemaDeleted);
    on<DataSchemaListed>(_onDataSchemaListed);
  }

  void _onDataSchemaRetrieved(DataSchemaRetrieved event, Emitter<DataSchemaState> emit) async {
    emit(DataSchemaWaiting());
    try {
      DataSchema dataSchema = await repository.retrieveDataSchema('');
      emit(DataSchemaDetailSuccess(dataSchema));
    } catch (error) {
      emit(DataSchemaError(error.toString()));
    }
  }

  void _onDataSchemaCreated(DataSchemaCreated event, Emitter<DataSchemaState> emit) async {
    // TODO: implement logic to create data schema
  }

  void _onDataSchemaUpdated(DataSchemaUpdated event, Emitter<DataSchemaState> emit) async {
    // TODO: implement logic to update data schema
  }

  void _onDataSchemaDeleted(DataSchemaDeleted event, Emitter<DataSchemaState> emit) async {
    // TODO: implement logic to delete data schema
  }

  void _onDataSchemaListed(DataSchemaListed event, Emitter<DataSchemaState> emit) async {
    emit(DataSchemaWaiting());
    try {
      List<DataSchema> dataSchemas = await repository.listDataSchemas();
      emit(DataSchemaListSuccess(dataSchemas));
    } catch (error) {
      emit(DataSchemaError(error.toString()));
    }
  }
}

