import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'shared/dependencies.dart';

void main() async {
  registerDependencies();

  await GetStorage.init();

  runApp(const App());
}
