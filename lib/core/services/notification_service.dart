 import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
 final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

// class NotificationService {
//   final FlutterLocalNotificationsPlugin _notificationsPlugin =  FlutterLocalNotificationsPlugin();
  

//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initialSettings = InitializationSettings(
//       android: initializationSettings,
//     );

//     await _notificationsPlugin.initialize(
//       initialSettings, 
//       onDidReceiveNotificationResponse: (notificationResponse) async{
//         if(notificationResponse.payload != null) {
//           navigatorkey.currentState?.pushNamed(notificationResponse.payload!);
//         }
//       }
//       );
//   }
  
//   _notificationDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max, priority: Priority.max),
//     );
//   }


//   Future<void> showNotification({int id = 0, String? title, String? body, String? payload}) async {
//     await _notificationsPlugin.show(id, title, body, await _notificationDetails(), payload: payload);
//   } 
// }