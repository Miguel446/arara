import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final fontSizeFactorProvider =
    StateNotifierProvider<FontSizeFactorNotifier, double>(
  (ref) => FontSizeFactorNotifier(),
);

class FontSizeFactorNotifier extends StateNotifier<double> {
  FontSizeFactorNotifier() : super(_storage.read(fontSizeFactorKey) ?? 1);

  static final _storage = GetStorage();
  static const fontSizeFactorKey = 'fontSizeFactor';

  set fontSizeFactor(double value) {
    state = value;
    _storage.write(fontSizeFactorKey, value);
  }
}
