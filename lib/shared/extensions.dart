import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String toLowerCaseWithNoDiacritics() {
    return removeDiacritics(toLowerCase());
  }

  String withId(String id) {
    return replaceFirst(':id', id);
  }
}

extension IntExtension on int {
  String withUnit(String singular, String plural) {
    return '$this ${this == 1 ? singular : plural}';
  }
}
