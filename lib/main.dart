import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'utils/dependencies.dart';

void main() async {
  registerDependencies();

  await GetStorage.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
