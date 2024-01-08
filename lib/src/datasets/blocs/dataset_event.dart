part of 'dataset_bloc.dart';

sealed class DataSetEvent extends Equatable {
  const DataSetEvent();

  @override
  List<Object?> get props => [];
}

class DataSetRetrieved extends DataSetEvent {
  final DataSet dataset;

  const DataSetRetrieved(this.dataset);

  @override
  List<Object?> get props => [dataset];
}
