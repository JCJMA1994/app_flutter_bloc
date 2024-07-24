import 'package:flutter/material.dart';

import '../../app/my_app.dart';
import 'app_config.dart';

void main() {
  AppConfig.instance.init(name: 'Development');

  runApp(const MyApp());
}
