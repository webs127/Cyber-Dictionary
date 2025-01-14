import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/dictionary/dictionary_view_model.dart';
import 'package:cyber_awareness/ui/dictionary/search_view.dart';
import 'package:cyber_awareness/ui/favourite/description.dart';
import 'package:cyber_awareness/ui/history/historypage_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    var historyWords = context.watch<HistoryViewModel>();

    return Consumer<DictionaryViewModel>(
      builder: (context, data, __) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: (appBarColor.loadColor() == null) ? appBarColor.selectedColor : Color(appBarColor.loadColor()!),
            centerTitle: true,
            title: Text("DICTIONARY", style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchView()));
              }, icon: Icon(Icons.search, color: ColorManager.white,)),

            ],
          ),
          body: (data.listTileObject == null)
              ? Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(
                        data.listTileObject!.listObject[i].title,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      onTap: () {
                        historyWords.addWordToHistory(WordObject(word: data
                                          .listTileObject!.listObject[i].title, meaning: data.listTileObject!
                                          .listObject[i].description,));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DescriptionPage(
                                      word: data
                                          .listTileObject!.listObject[i].title,
                                      description: data.listTileObject!
                                          .listObject[i].description,
                                    )));
                      },
                    );
                  },
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: data.listTileObject!.listObject.length),
        );
      }
    );
  }
}