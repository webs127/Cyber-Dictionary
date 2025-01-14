import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class HistoryViewModel with ChangeNotifier implements BaseViewModel, HistoryViewModelInput, HistoryViewModelOutput {
  late List<WordObject> _historyWords;
  bool exists = false;
  List<WordObject> get historyWords => List.unmodifiable(_historyWords);
  HistoryViewModel() {
    start();
  }
  @override
  void start() {
    _historyWords= [];
  }
  
  @override
  void addWordToHistory(WordObject word) {
    for (var fword in _historyWords) {
      if (fword.word == word.word) {
        exists = true;
        break;
      }
    }
    if (!exists) {
      if (word.word!.isNotEmpty && word.meaning!.isNotEmpty) {
        _historyWords.add(word);
      }
    }
    notifyListeners();
    exists = false;
  }
  
  @override
  void removeWordFromHistory(int index) {
    _historyWords.removeAt(index);
    notifyListeners();
  }
}

abstract class HistoryViewModelInput {
  void addWordToHistory(WordObject word);
}

abstract class HistoryViewModelOutput {
  void removeWordFromHistory(int index);
}