import 'package:cyber_awareness/ui/add/add.dart';
import 'package:cyber_awareness/ui/dictionary/dictionary.dart';
import 'package:cyber_awareness/ui/favourite/favourite.dart';
import 'package:cyber_awareness/ui/landing/landing.dart';
import 'package:cyber_awareness/ui/notification/notification_view.dart';
import 'package:cyber_awareness/ui/settings/settings.dart';
import 'package:cyber_awareness/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String splash = "/";
  static const String landing = "/landing";
  static const String dictionary = "/landing/dictionary";
  static const String notificationView = "/notification";
  static const String addword = "/landing/addword";
  static const String favourite = "/landing/favourite";
  static const String settings = "/landing/settings";
}

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case RouteManager.dictionary:
        return MaterialPageRoute(builder: (_) => const DictionaryScreen());
      case RouteManager.addword:
        return MaterialPageRoute(builder: (_) => const AddWordScreen());
      case RouteManager.favourite:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case RouteManager.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
        case RouteManager.notificationView:
        return MaterialPageRoute(builder: (_) => const NotificationView());
        
      default:
      return undefined();
    }
  }
    static Route<dynamic> undefined() {
      return MaterialPageRoute(builder: (_) => const Scaffold());
    }
}