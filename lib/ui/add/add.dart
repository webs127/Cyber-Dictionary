import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:cyber_awareness/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final TextEditingController _word = TextEditingController();
  final TextEditingController _meaning = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    return Consumer<AddViewModel>(builder: (context, data, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: getColor(appBarColor),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "ADD WORD",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _word,
                    cursorColor: ColorManager.black,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorManager.black)),
                        labelText: "Enter Word",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: _meaning,
                    cursorColor: ColorManager.black,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorManager.black)),
                        labelText: "Enter Meaning",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              )),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: data.isFavourite,
                    child: Container(
                      width: 30.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: (data.favourite)
                              ? getColor(appBarColor)
                              : ColorManager.white,
                          border: Border.all(color: ColorManager.black),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: (data.favourite)
                          ? Icon(
                              Icons.check,
                              color: ColorManager.white,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Favourite",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: getColor(appBarColor),
            onPressed: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              data.addWord(
                  WordObject(word: _word.text, meaning: _meaning.text));
              (data.favourite)
                  ? modalBottomSheetWidget(context, getColor(appBarColor))
                  : null;
            },
            child: const Icon(Icons.add_box)),
      );
    });
  }

  Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
