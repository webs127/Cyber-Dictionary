import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavDescriptionPage extends StatelessWidget {
  final String word;
  final String description;
  const FavDescriptionPage(
      {super.key, required this.word, required this.description});

  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor(appBarColor),
        centerTitle: true,
        elevation: 0,
        
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
