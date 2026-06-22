import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/core/helpful_functions/format_date.dart';
import 'package:websocket/models/notifications_model.dart';
import 'package:websocket/views/notifications/notifications_controller/notifications_controller.dart';

class NotificationsScreen extends StatelessWidget {

  final NotificationsController notificationsController=Get.put(NotificationsController());
   NotificationsScreen( {super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text('Notifications'),centerTitle: true,),
      body: StreamBuilder<List<NotificationsModel>>(
        stream: notificationsController.fetchNontifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No notifications found"));
          }
          final item = snapshot.data!;
          return  ListView.builder(
           itemCount: item.length,
           itemBuilder: (context, index) {
             var doc = item[index];

             return  Card(
               child: ListTile(
                 title: Text(doc.title),
                 subtitle: Text(doc.message),
                 trailing: Text(FormatDateClass.formatFirebaseTime(doc.createdAt)),
               ),
             );
           },
                      );
        },
      ),
    );
  }
}
