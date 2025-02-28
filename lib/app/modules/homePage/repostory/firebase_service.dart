import 'package:cloud_firestore/cloud_firestore.dart';
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
    // _sendPushNotification(task);
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



  // Future<void> _sendPushNotification(String task) async {
  //   try {
  //     await FirebaseMessaging.instance.subscribeToTopic("tasks");
  //     await FirebaseFirestore.instance.collection("notifications").add({
  //       "title": "New Task Added",
  //       "body": task,
  //       "timestamp": FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print("Error sending notification: $e");
  //   }
  // }
}
