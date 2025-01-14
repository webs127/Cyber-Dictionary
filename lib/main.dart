import 'package:cyber_awareness/app/main.dart';
import 'package:cyber_awareness/core/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SharedPreferencesLocalStorage.getInstance();
  runApp(MyApp());
}

// callback() {}
