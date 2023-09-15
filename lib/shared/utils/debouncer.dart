import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  final VoidCallback action;
  Timer? _timer;

  Debouncer({required this.milliseconds, required this.action});

  run() {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
