import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_quanttide_data/src/datasets/schemas/dataset.dart';
import 'package:flutter_quanttide_data/src/datasets/repositories/dataset_repository.dart';

part 'dataset_event.dart';
part 'dataset_state.dart';


class DataSetBloc extends Bloc<DataSetEvent, DataSetState> {
  final DataSetRepository repository;

  DataSetBloc({required this.repository}) : super(DataSetInitial()) {
    on<DataSetRetrieved>(_onDataSetRetrieved);
  }

  /// Handles the [DataSetRetrieved] event.
  void _onDataSetRetrieved(DataSetRetrieved event, Emitter<DataSetState> emit) async {
    // emit waiting state
    emit(DataSetWaiting());
    // retrieve dataset
    try {
      DataSet dataset = await repository.retrieve(event.dataset.id);
      // emit success state
      emit(DataSetLoaded(dataset));
    }
    catch (e) {
      // emit error state
      emit(DataSetError(e.toString()));
    }
  }
}
