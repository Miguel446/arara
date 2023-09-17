import 'dart:math';

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

extension ListExtension<T> on List<T> {
  List<T> getRandomSubset() {
    final random = Random();
    final subsetSize = random.nextInt(length + 1);
    final selectedIndices = <int>{};

    while (selectedIndices.length < subsetSize) {
      final randomIndex = random.nextInt(length);
      selectedIndices.add(randomIndex);
    }

    return selectedIndices.map((index) => elementAt(index)).toList();
  }
}
