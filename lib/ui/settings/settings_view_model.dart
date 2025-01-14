import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:cyber_awareness/core/shared_pref.dart';
import 'package:cyber_awareness/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class SettingsViewModel
    with ChangeNotifier
    implements BaseViewModel, SettingsViewModelInput, SettingsViewModelOutput {
  Color selectedColor = ColorManager.splash;
  int currentColor = 0;
  late List<Color> _listColors;
  List<Color> get listColors => List.unmodifiable(_listColors);

  SettingsViewModel() {
    start();
  }
  @override
  void start() {
    _listColors = _getColors();
  }

  static List<Color> _getColors() => [
        ColorManager.splash,
        ColorManager.lightblue,
        ColorManager.darkblue,
        ColorManager.red,
        ColorManager.purple,
        ColorManager.green,
        ColorManager.dark,
        ColorManager.yellow,
        ColorManager.pink,
        ColorManager.orange,
      ];

  @override
  void onSelected(Color color) {
    selectedColor = color;
    SharedPreferencesLocalStorage().setInt("color", selectedColor.value);
    notifyListeners();
  }

  int? loadColor() {
    int? color = SharedPreferencesLocalStorage().getInt("color");
    return color;
    
  }
}

abstract class SettingsViewModelInput {
  void onSelected(Color color);
}

abstract class SettingsViewModelOutput {}

// import 'dart:async';

// import 'package:cyber_awareness/core/manager/color_manager.dart';
// import 'package:cyber_awareness/ui/base/base_view_model.dart';
// import 'package:flutter/material.dart';

// class SettingsViewModel
//     implements BaseViewModel, SettingsViewModelInput, SettingsViewModelOutput {

//   final StreamController _streamController = StreamController();
//   Color? selectedColor;
//   int currentColor = 0;
//   late List<Color> _listColors;
//   @override
//   void dispose() {
//     _streamController.close();
//   }

//   @override
//   Sink get settingViewInput => _streamController.sink;

//   @override
//   Stream<ThemeViewModelObject> get settingViewOutput =>
//       _streamController.stream.map((event) => event);

//   @override
//   void start() {
//     listColors = _getColors();
//     _postDataToView();
//   }

//   void _postDataToView() {
//     settingViewInput.add(ThemeViewModelObject(
//         ThemeColorViewModel(listColors), currentColor, listColors.length));
//   }

//   void onChanged(int index) {
//     currentColor = index;
//     //_postDataToView();
//   }



//   @override
//   void onSelected(Color color) {
//     selectedColor = color;
//     _postDataToView();
//   }
// }


// class ThemeColorViewModel {
//   final List<Color> color;

//   ThemeColorViewModel(this.color);
// }

// class ThemeViewModelObject {
//   final ThemeColorViewModel themeViewModel;
//   final int currentColor;
//   final int length;

//   ThemeViewModelObject(this.themeViewModel, this.currentColor, this.length);
// }

// (value == null) ? 