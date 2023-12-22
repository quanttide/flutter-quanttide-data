import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dataset_event.dart';
part 'dataset_state.dart';

class DataSetBloc extends Bloc<DataSetEvent, DataSetState> {
  DataSetBloc() : super(DataSetInitial()) {
    on<DataSetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
