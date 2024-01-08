part of 'dataset_bloc.dart';

sealed class DataSetState extends Equatable {
  const DataSetState();

  @override
  List<Object?> get props => [];
}

class DataSetInitial extends DataSetState {}

class DataSetWaiting extends DataSetState {}

class DataSetError extends DataSetState {
  final String message;

  const DataSetError(this.message);

  @override
  List<Object?> get props => [message];
}

class DataSetLoaded extends DataSetState {
  final DataSet dataset;

  const DataSetLoaded(this.dataset);

  @override
  List<Object?> get props => [dataset];
}
