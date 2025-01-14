import 'package:cyber_awareness/app/route.dart';
import 'package:cyber_awareness/core/services/notification_service.dart';
import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/dictionary/dictionary_view_model.dart';
import 'package:cyber_awareness/ui/history/historypage_view_model.dart';
import 'package:cyber_awareness/ui/landing/landing_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 942),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AddViewModel()),
          ChangeNotifierProvider(create: (_) => HistoryViewModel()),
          ChangeNotifierProvider(create: (_) => DictionaryViewModel()),
          ChangeNotifierProvider(create: (_) => SettingsViewModel()),
          ChangeNotifierProvider(create: (_) => LandingViewModel()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorkey,
          title: 'Cyber Dictionary',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.getRoute,
          initialRoute: RouteManager.splash,
        ),
      ),
    );
  }
}
