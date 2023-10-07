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

extension DateTimeExtension on DateTime {
  String toSomeTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return '${difference.inDays.withUnit('dia', 'dias')} atrás';
    } else if (difference.inHours > 0) {
      return '${difference.inHours.withUnit('hora', 'horas')} atrás';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes.withUnit('minuto', 'minutos')} atrás';
    } else {
      return 'Agora';
    }
  }
}
