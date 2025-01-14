import 'package:cyber_awareness/core/constants/image_constants.dart';
import 'package:cyber_awareness/ui/landing/landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<LandingViewModel>(
      builder: (context, data, __) {
        return Scaffold(
            body: data.initialScreen,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: data.currentIndex,
                selectedItemColor: Colors.black,
                selectedFontSize: 13.sp,
                unselectedFontSize: 11.sp,
                onTap: data.onChanged,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey,
                items: const [
                  BottomNavigationBarItem(
                      label: "DICTIONARY",
                      icon: ImageIcon(AssetImage(ImageManager.book))),
                  BottomNavigationBarItem(
                      label: "ADD WORD",
                      icon: ImageIcon(AssetImage(ImageManager.add))),
                  BottomNavigationBarItem(
                      label: "FAVOURITE",
                      icon: ImageIcon(AssetImage(ImageManager.love))),
                  BottomNavigationBarItem(
                      label: "SETTINGS",
                      icon: ImageIcon(AssetImage(ImageManager.settings))),
                ]),
          );
      }
    );
  }

}
