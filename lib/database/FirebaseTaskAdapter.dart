import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routinely/database/DatabaseTaskAdapter.dart';
import 'package:routinely/widgets/Task.dart';

class FirebaseTaskAdapter implements DatabaseTaskAdapter {
  Firestore firebaseInstance;
  FirebaseTaskAdapter(this.firebaseInstance);

  @override
  getTaskList(String userId) {
    return StreamBuilder<QuerySnapshot>(
        stream: firebaseInstance
            .collection('tasks')
            .where('user', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return new Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new Column(
                children: getTasks(snapshot),
              );
          }
        });
  }

  getTasks(AsyncSnapshot<QuerySnapshot> snapshot) {
    List list = snapshot.data.documents
        .map((DocumentSnapshot doc) => new TaskWidget(
              title: doc["name"],
              time: doc["time"],
              due: (doc["due"] as Timestamp).toDate(),
              id: doc.documentID,
            ))
        .toList();

    if (list.length == 0) {
      return list;
    }

    return list;
  }

  @override
  deleteTask(String id) {
    firebaseInstance.collection('tasks').document(id).delete();
  }

  @override
  createTask({String name, int time, DateTime due, String userId}) {
    firebaseInstance.collection('tasks').add(<String, dynamic>{
      'name': name,
      'due': Timestamp.fromDate(due),
      'time': time,
      'user': userId
    });
  }

  @override
  updateTask(String name, int time, DateTime due, String id) {
    firebaseInstance
        .collection('tasks')
        .document(id)
        .updateData(<String, dynamic>{
      'name': name,
      'due': Timestamp.fromDate(due),
      'time': time
    });
  }
}
