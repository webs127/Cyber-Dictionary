import 'package:cyber_awareness/app/route.dart';
import 'package:cyber_awareness/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void nextPage() {
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RouteManager.landing));
  }
  @override
  void initState() {
    super.initState();
    nextPage();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: 942.h,
              width: 430.w,
        child: Stack(
          children: [
            SizedBox(
              height: 942.h,
              width: 430.w,
              child: const Image(image: AssetImage(ImageManager.backgroundImage), fit: BoxFit.cover,)
              ),
              Positioned(
                top: 365.h,
                right: 38.w,
                child: SizedBox(
                height: 368.16.h,
                width: 320.w,
                child: const Image(image: AssetImage(ImageManager.searchBackgroundImage), fit: BoxFit.cover,))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(child: Text("CYBER DICTIONARY", style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
                    SizedBox(height: 25.h,),
                    Center(child: Text("E-learning", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.grey),)),
                    SizedBox(height: 34.h,)
                  ],
                ),
      
          ],
        ),
      ),
    );
  }
}