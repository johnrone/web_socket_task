import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String title;
  final String message;
  final Timestamp createdAt;

  NotificationsModel({required this.title, required this.message, required this.createdAt});
factory NotificationsModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NotificationsModel(
      title: data['title'] ?? 'No Title',
      message: data['message'] ?? '',
      createdAt: data['createdAt'] is Timestamp
          ? data['createdAt']
          : Timestamp.now(),
    );
  }

}