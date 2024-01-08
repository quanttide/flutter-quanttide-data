import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_quanttide/flutter_quanttide.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';

class MockApiClient extends Mock implements ApiClient {}


void main() {
  late DataSetRepository dataSetRepository;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSetRepository = DataSetRepository(apiClient: mockApiClient);
  });

  group('DataSetRepository', () {
    test('listDataSets returns a list of DataSet objects', () async {
      // Arrange
      when(mockApiClient.request(httpMethod: 'GET', apiPath: '/datasets'))
          .thenAnswer((_) async => [{'id': '1', 'name': 'dataset1'}]);

      // Act
      final dataSets = await dataSetRepository.listDataSets();

      // Assert
      expect(dataSets, isA<List<DataSet>>());
      expect(dataSets.length, 1);
      expect(dataSets[0].id, '1');
      expect(dataSets[0].name, 'dataset1');
    });

    test('retrieveDataSet returns a DataSet object', () async {
      // Arrange
      const dataSetId = '1';
      when(mockApiClient.request(httpMethod: 'GET', apiPath: '/datasets/$dataSetId'))
          .thenAnswer((_) async => {'id': dataSetId, 'name': 'DataSet 1'});

      // Act
      final dataSet = await dataSetRepository.retrieveDataSet(dataSetId);

      // Assert
      expect(dataSet, isA<DataSet>());
      expect(dataSet.id, dataSetId);
      expect(dataSet.name, 'DataSet 1');
    });

    test('createDataSet sends a POST request with the correct data', () async {
      // Arrange
      final dataSetToCreate = DataSet(id: '1', name: 'New DataSet', verboseName: '');
      when(mockApiClient.request(
        httpMethod: 'POST',
        apiPath: '/datasets',
        data: dataSetToCreate.toJson(),
      )).thenAnswer((_) async => {});

      // Act
      await dataSetRepository.createDataSet(dataSetToCreate);

      // Assert
      verify(mockApiClient.request(
        httpMethod: 'POST',
        apiPath: '/datasets',
        data: dataSetToCreate.toJson(),
      )).called(1);
    });

    test('deleteDataSet sends a DELETE request with the correct path', () async {
      // Arrange
      const dataSetIdToDelete = '1';
      when(mockApiClient.request(httpMethod: 'DELETE', apiPath: '/datasets/$dataSetIdToDelete'))
          .thenAnswer((_) async => {});

      // Act
      await dataSetRepository.deleteDataSet(dataSetIdToDelete);

      // Assert
      verify(mockApiClient.request(httpMethod: 'DELETE', apiPath: '/datasets/$dataSetIdToDelete'))
          .called(1);
    });
  }, skip: true);
}
