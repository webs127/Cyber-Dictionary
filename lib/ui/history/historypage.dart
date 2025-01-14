import 'package:cyber_awareness/ui/history/historypage_view_model.dart';
import 'package:cyber_awareness/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var appBarColor = Provider.of<SettingsViewModel>(context);
    return Consumer<HistoryViewModel>(
      builder: (context, history, __) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: getColor(appBarColor),
            centerTitle: true,
            title: Text(
              "HISTORY",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: (history.historyWords.isEmpty)
              ? Center(
                  child: Text(
                    "No History",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, i) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: const Icon(IcoFontIcons.bin, color: Colors.white),
                      ),
                      key: Key(history.historyWords[i].word!),
                      onDismissed: (direction) {
                        history.removeWordFromHistory(i);
                      },
                      child: ListTile(
                        title: Text(
                          history.historyWords[i].word!,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return Divider(
                      key: Key(history.historyWords[i].word!),
                    );},
                  itemCount: history.historyWords.length),
        );
      }
    );
  }
    Color getColor(SettingsViewModel data) {
    return (data.loadColor() == null)
        ? data.selectedColor
        : Color(data.loadColor()!);
  }
}
