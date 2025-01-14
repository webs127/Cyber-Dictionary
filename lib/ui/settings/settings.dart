import 'package:cyber_awareness/core/constants/image_constants.dart';
import 'package:cyber_awareness/ui/history/historyPage.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewModel>(builder: (context, data, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: getColor(data),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "SETTINGS",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 21.0.h),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 39.h,
                      height: 39.h,
                      child:
                          const Image(image: AssetImage(ImageManager.palette))),
                  SizedBox(width: 3.w),
                  Text(
                    "Themes",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Wrap(
                runSpacing: 19.r,
                children: List.generate(10, (index) {
                  return InkWell(
                    onTap: () {
                      data.onSelected(data.listColors[index]);
                    },
                    child: Container(
                      width: 65.h,
                      height: 66.h,
                      margin: EdgeInsets.only(right: 21.r),
                      color: data.listColors[index],
                      child: Center(
                        child: Icon(
                          (data.loadColor() == null)
                              ? null
                              : (data.listColors[index] ==
                                      Color(data.loadColor()!))
                                  ? Icons.check_rounded
                                  : null,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 56.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicWidth(
                    child: InkWell(
                      onTap: () {
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 5.r,
                          bottom: 5.r,
                        ),
                        width: 193.w,
                        decoration: BoxDecoration(
                            color: getColor(data),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Column(
                          children: [
                            const Icon(Icons.share_outlined,
                                color: Colors.white),
                            Text(
                              "SHARE APP",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IntrinsicWidth(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HistoryPage()));
                      },
                      child: Container(
                        width: 193.w,
                        padding: EdgeInsets.only(
                          top: 5.r,
                          bottom: 5.r,
                        ),
                        decoration: BoxDecoration(
                            color: getColor(data),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Column(
                          children: [
                            const Icon(Icons.history_outlined,
                                color: Colors.white),
                            Text(
                              "HISTORY",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
