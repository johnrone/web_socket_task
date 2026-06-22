  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
class FormatDateClass {
 static String formatTimestamp(String timestamp) {
    try {
      final date = DateTime.parse(timestamp);
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute
          .toString()
          .padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
    } catch (e) {
      print('error formatting timestamp: $e');
      return timestamp;
    }
  }

 static String formatFirebaseTime(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formatDate = DateFormat('EEE, dd /MM /yyyy h:m ').format(dateTime);
    return formatDate;
  }
}
  