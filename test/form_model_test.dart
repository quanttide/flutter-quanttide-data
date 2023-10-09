import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quanttide_data/flutter_quanttide_data.dart';


void main() {
  group('DataForm', () {
    test('toJson', () {
      const form = DataForm(
        fields: [
          DataFormField(name: 'Field 1'),
          DataFormField(name: 'Field 2'),
        ],
      );

      final json = form.toJson();

      expect(json, {
        'fields': [
          {'name': 'Field 1'},
          {'name': 'Field 2'},
        ],
      });
    });

    test('fromJson', () {
      final json = {
        'fields': [
          {'name': 'Field 1'},
          {'name': 'Field 2'},
        ],
      };

      final form = DataForm.fromJson(json);

      expect(form.fields.length, 2);
      expect(form.fields[0].name, 'Field 1');
      expect(form.fields[1].name, 'Field 2');
    });
  });

  group('DataFormField', () {
    test('toJson', () {
      const field = DataFormField(name: 'Field Name');

      final json = field.toJson();

      expect(json, {'name': 'Field Name'});
    });

    test('fromJson', () {
      final json = {'name': 'Field Name'};

      final field = DataFormField.fromJson(json);

      expect(field.name, 'Field Name');
    });
  });
}