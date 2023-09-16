import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String toLowerCaseWithNoDiacritics() {
    return removeDiacritics(toLowerCase());
  }

  String withId(String id) {
    return replaceFirst(':id', id);
  }
}
