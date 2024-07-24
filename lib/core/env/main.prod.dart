import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../app/my_app.dart';
import 'app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();

  AppConfig.instance.init(name: 'Production');

  runApp(const MyApp());
}
