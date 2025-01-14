import 'package:cyber_awareness/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class AddViewModel
    with ChangeNotifier
    implements BaseViewModel, AddViewModelInput, AddViewModelOutput {
  AddViewModel() {
    start();
  }
  late List<WordObject> _wordLstObjects;
  List<WordObject> get wordLstObjects => _wordLstObjects;
  List<WordObject> favouriteWords = [];
  bool exists = false;
  int currentIndex = 0;
  bool favourite = false;
  @override
  void onChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void start() {
    _wordLstObjects = [];
  }

  @override
  void addWord(WordObject word) {
    for (var fword in favouriteWords) {
      if (fword.word == word.word) {
        exists = true;
        break;
      }
    }
    if (!exists) {
      if (favourite || (word.word!.isNotEmpty && word.meaning!.isNotEmpty)) {
        //_wordLstObjects.add(word);
        favouriteWords.add(word);
      }
    }
    notifyListeners();
    exists = false;
  }

  @override
  void isFavourite() {
    favourite = !favourite;
    notifyListeners();
  }

  void clearHistory() {
    favouriteWords.clear();
    notifyListeners();
  }
}

abstract class AddViewModelInput {
  void onChanged(int index);
  void isFavourite();
}

abstract class AddViewModelOutput {
  void addWord(WordObject word);
}

class WordObject {
  final String? word;
  final String? meaning;

  WordObject({required this.word, required this.meaning});
}
