// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// class NotificationPage extends StatefulWidget {
//   const NotificationPage({super.key});
//
//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//   @override
//   void initState() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notification"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {},
//           child: const Text("Button"),
//         ),
//       ),
//     );
//   }
// }
