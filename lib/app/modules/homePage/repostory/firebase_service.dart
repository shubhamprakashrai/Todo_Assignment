import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "tasks";

  Future<void> addTask(String task) async {
    await _firestore.collection(collectionName).add({
      "task": task,
      "createdAt": FieldValue.serverTimestamp(),
    });


     // Send a push notification
    await sendPushNotification(task);
  }

  Future<void> updateTask(String taskId, String newTask) async {
    await _firestore.collection(collectionName).doc(taskId).update({
      "task": newTask,
    });
  }

  Future<void> deleteTask(String taskId) async {
    await _firestore.collection(collectionName).doc(taskId).delete();
  }

  Stream<List<Map<String, dynamic>>> getTasks() {
    return _firestore
        .collection(collectionName)
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return {
          "id": doc.id,
          "task": doc["task"],
        };
      }).toList();
    });
  }



  Future<void> sendPushNotification(String task) async {
    const String serverKey = "key";
    const String fcmUrl = "https://fcm.googleapis.com/fcm/send";

    final Map<String, dynamic> notificationData = {
      "to": "/topics/tasks",
      "notification": {
        "title": "New Task Added",
        "body": task,
        "sound": "default"
      },
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "task": task,
      }
    };

    try {
      final response = await http.post(
        Uri.parse(fcmUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$serverKey",
        },
        body: jsonEncode(notificationData),
      );

      if (response.statusCode == 200) {
        debugPrint("✅ Notification Sent: ${response.body}");
      } else {
        debugPrint("Failed to send notification: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error sending notification: $e");
    }
  }

}
