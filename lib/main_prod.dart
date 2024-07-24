import 'package:app_bloc/app_config.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  AppConfig.instance.init(name: 'prod');

  runApp(const MyApp());
}
