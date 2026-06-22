import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:websocket/models/notifications_model.dart';

class NotificationsController extends GetxController {
  @override
  void onInit(){
    super.onInit();
    fetchNontifications();
  }
  Stream<List<NotificationsModel>> fetchNontifications() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.value([]);
    }

    return FirebaseFirestore.instance
        .collection('notifications')
        .doc(user.uid)
        .collection('notifications')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationsModel.fromFirestore(doc))
            .toList());

  }
}
