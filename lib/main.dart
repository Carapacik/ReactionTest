import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reactiontest/app.dart';
import 'package:reactiontest/settings_page/settings_controller.dart';
import 'package:reactiontest/settings_page/settings_service.dart';
import 'package:reactiontest/utils.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  await dotenv.load();
  await initAd();
  runApp(App(settingsController: settingsController));
}
