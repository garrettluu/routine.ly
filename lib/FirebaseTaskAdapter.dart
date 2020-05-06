import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routinely/DatabaseTaskAdapter.dart';
import 'package:routinely/main.dart';

class FirebaseTaskAdapter implements DatabaseTaskAdapter{
  Firestore firebaseInstance;
  FirebaseTaskAdapter(this.firebaseInstance);

  @override
  getTaskList() {
    return StreamBuilder<QuerySnapshot>(
      stream: firebaseInstance.collection('tasks').snapshots(),
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
      }
    );
  }

  getTasks(AsyncSnapshot<QuerySnapshot> snapshot) {
    List list = snapshot.data.documents.map(
      (DocumentSnapshot doc) => new Task(
        title: doc["name"],
        time: doc["time"],
        due: (doc["due"] as Timestamp).toDate(),
        id: doc.documentID,
      )
    ).toList();

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
  createTask({String name, String time, DateTime due}) {
    firebaseInstance.collection('tasks').add(<String, dynamic>{'name': name, 'due': Timestamp.fromDate(due), 'time': time});
  }

  @override
  updateTask(String name, String time, DateTime due, String id) {
    firebaseInstance.collection('tasks').document(id).updateData(
      <String, dynamic>{'name': name, 'due': Timestamp.fromDate(due), 'time': time}
    );
  }
}