import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/dictionary/dictionary_view_model.dart';
import 'package:cyber_awareness/ui/favourite/description.dart';
import 'package:cyber_awareness/ui/history/historypage_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    var addToHistry = Provider.of<HistoryViewModel>(context);
    return Consumer<DictionaryViewModel>(builder: (context, data, __) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
          backgroundColor: getColor(appBarColor),
          title: TextField(
            cursorColor: ColorManager.black,
            onChanged: data.onChanged,
            decoration: InputDecoration(
              fillColor: ColorManager.white,
              filled: true,
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: getColor(appBarColor))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: getColor(appBarColor))
              ),
              hintText: "Search Word",
              hintStyle:TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
            ),
          ),
        body: (data.filteredObject == null)
            ? const SizedBox()
            : ListView.separated(
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(
                      data.filteredObject!.listObject[i].title,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if(!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      var word = WordObject(word: data
                                        .filteredObject!.listObject[i].title, meaning: data.filteredObject!
                                        .listObject[i].description);
                      addToHistry.addWordToHistory(word);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DescriptionPage(
                                    word: data
                                        .filteredObject!.listObject[i].title,
                                    description: data.filteredObject!
                                        .listObject[i].description,
                                  )));
                    },
                  );
                },
                separatorBuilder: (context, i) => const Divider(),
                itemCount: data.filteredObject!.listObject.length),
      );
    });
  }
    Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
