import 'package:app_bloc/env/app_config.dart';
import 'package:flutter/material.dart';

import '../app/my_app.dart';

void main() {
  AppConfig.instance.init(name: 'Development');

  runApp(const MyApp());
}
