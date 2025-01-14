import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:cyber_awareness/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatelessWidget {
  final String word;
  final String description;
  const DescriptionPage(
      {super.key, required this.word, required this.description});

  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor(appBarColor),
        centerTitle: true,
        elevation: 0,
        actions: [
          Consumer<AddViewModel>(
            builder: (context, data, __) {
              return IconButton(
                onPressed: () {
                  data.favourite = true;
                  WordObject favWord = WordObject(word: word, meaning: description);
                  data.addWord(favWord);
                  (data.favourite) ? modalBottomSheetWidget(context, getColor(appBarColor)) : null;
                },
                tooltip: "Add Word",
                icon: Icon(
                  Icons.add_box_outlined,
                  color: ColorManager.white,
                ),
              );
            }
          ),
        ],
        title: Text(
          word,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
          child: Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
                height: 2.sp,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
  Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
