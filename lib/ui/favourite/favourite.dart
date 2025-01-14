import 'package:cyber_awareness/ui/add/add_view_model.dart';
import 'package:cyber_awareness/ui/favourite/fav_description.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
              "FAVOURITE",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    data.clearHistory();
                  },
                  icon: const Icon(IcoFontIcons.bin, color: Colors.white),)
            ],
          ),
          body: (data.favouriteWords.isEmpty)
              ? Center(
                  child: Text("no Favourite Words",style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),),
                )
              : ListView.separated(
                  itemCount: data.favouriteWords.length,
                  separatorBuilder: (context, i) {
                    return const Divider();
                  },
                  itemBuilder: (context, i) {
                    var favWord = data.favouriteWords[i];
                    return ListTile(
                      title: Text(
                        favWord.word!,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FavDescriptionPage(
                                    word: favWord.word!,
                                    description: favWord.meaning!)));
                      },
                    );
                  }));
    });
  }
      Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
