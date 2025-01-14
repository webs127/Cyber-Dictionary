import 'dart:convert';
import 'dart:math';
import 'package:cyber_awareness/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class DictionaryViewModel extends ChangeNotifier implements BaseViewModel, DictionaryViewModelInput, DictionaryViewModelOutput {
  ListTileObject? listTileObject;
  late ListObject randomWord;
  late int _length;
  ListTileObject? filteredObject;
  String searchInput = '';
  DictionaryViewModel() {
    start();
  }
  @override
  void start() {
    loadApi();
  }


  @override
  Future<void> loadApi() async {
    final String jsonString =
        await rootBundle.loadString('asset/json/json_api.json');
    final data = jsonDecode(jsonString);
    listTileObject = ListTileObject.fromJson(data);
    _length = listTileObject!.listObject.length;
    randomWord = generateRandomWord();
    notifyListeners();
  }

  @override
  void onChanged(String value) {
    searchInput = value;
    setFilteredList();
    notifyListeners();
  }

  @override
  void setFilteredList() {
    filteredObject = ListTileObject(
        listObject: listTileObject!.listObject
            .where(
                (element) => element.title.toLowerCase().contains(searchInput))
            .toList());
    notifyListeners();
  }

  @override
  ListObject generateRandomWord() {
    Random random = Random();
    int randomIndex = random.nextInt(_length - 1);
    return listTileObject!.listObject[randomIndex];
  }
}

abstract class DictionaryViewModelInput {
  Future<void> loadApi();
  void onChanged(String value);
  ListObject generateRandomWord();
}

abstract class DictionaryViewModelOutput {
  void setFilteredList();
}

class ListTileObject {
  final List<ListObject> listObject;

  ListTileObject({required this.listObject});

  factory ListTileObject.fromJson(List jsonLIst) {
    List<ListObject> list =
        jsonLIst.map((e) => ListObject.fromJson(e)).toList();
    return ListTileObject(listObject: list);
  }
}

class ListObject {
  final String title;
  final String description;

  ListObject({required this.title, required this.description});

  factory ListObject.fromJson(Map<String, dynamic> json) =>
      ListObject(title: json['name'], description: json['description']);
}
