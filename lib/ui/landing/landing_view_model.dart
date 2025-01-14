
import 'package:cyber_awareness/ui/add/add.dart';
import 'package:cyber_awareness/ui/base/base_view_model.dart';
import 'package:cyber_awareness/ui/dictionary/dictionary.dart';
import 'package:cyber_awareness/ui/favourite/favourite.dart';
import 'package:cyber_awareness/ui/settings/settings.dart';
import 'package:flutter/material.dart';


class LandingViewModel extends ChangeNotifier
    implements BaseViewModel, LandingViewModelInput {
  late List _screens;
  List get screen => List.unmodifiable(_screens);
  
  int currentIndex = 0;
  Widget initialScreen = 
        const DictionaryScreen(); 

  LandingViewModel() {
    start();
  }

  static List _getView() => [
        const DictionaryScreen(),
        const AddWordScreen(),
        const FavouriteScreen(),
        const SettingsScreen()
      ];

  @override
  void onChanged(int index) {
    currentIndex = index;
    _postDataToView();
    notifyListeners();
  }

  @override
  void start() {
    _screens = _getView();
  }

    _postDataToView() {
    initialScreen = _screens[currentIndex];
    notifyListeners();
  }
}

abstract class LandingViewModelInput {
  void onChanged(int index);
}


