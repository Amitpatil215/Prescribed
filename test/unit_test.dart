import 'package:doctor_duniya/constant_data/drgree_field_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DegreeField degreeField;
  setUp(() {
    degreeField = DegreeField();
  });
  test("List of degree", () {
    final List<String> allDegree = degreeField.allDegree as List<String>;
    expect(allDegree.length, 1);
  });
}
