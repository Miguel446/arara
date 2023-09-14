import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String toLowerCaseWithNoDiacritics() {
    return removeDiacritics(toLowerCase());
  }
}
