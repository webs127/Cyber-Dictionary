import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll("#", "");
    if(color.length == 6) {
      color = "FF$color";
    }
  return Color(int.tryParse(color, radix: 16)!);
  }
}

class ColorManager {
  static Color splash = HexColor.hexString("#00012E");
  static Color white = HexColor.hexString("#FFFFFF");
  static Color lightblue = HexColor.hexString("#00F3E4");
  static Color darkblue = HexColor.hexString("#006C9A");
  static Color red = HexColor.hexString("#EF3F61");
  static Color purple = HexColor.hexString("#621E81");
  static Color green = HexColor.hexString("#00B906");
  static Color dark = HexColor.hexString("#424242");
  static Color yellow = HexColor.hexString("#FFCE3E");
  static Color pink = HexColor.hexString("#F638DC");
  static Color orange = HexColor.hexString("#C95501");
  static Color black = HexColor.hexString("#000000");

  static List listColors = [
    ColorManager.splash,
    ColorManager.lightblue,
    ColorManager.darkblue,
    ColorManager.red,
    ColorManager.purple,
    ColorManager.green,
    ColorManager.dark,
    ColorManager.yellow,
    ColorManager.pink,
    ColorManager.orange,
  ];
}