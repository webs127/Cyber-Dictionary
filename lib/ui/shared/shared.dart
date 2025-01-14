import 'package:cyber_awareness/core/manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

Future<dynamic> modalBottomSheetWidget(BuildContext context, Color? appBarColor) {
    return showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      width: 430.w,
                      height: 60.h,
                      color: appBarColor ?? ColorManager.splash,
                      child: Row(
                        children: [
                          const Icon(IcoFontIcons.love, color: Colors.red),
                          SizedBox(width: 20.w,),
                          Text("Successfully added to Favourites", style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          )),
                        ],
                      ),
                    );
                  });
  }