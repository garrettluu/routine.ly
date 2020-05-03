import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routinely/main.dart';

class Firebase {
  Firestore firebaseInstance;
  Firebase(this.firebaseInstance);

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
            return new ListView(
              children: getTasks(snapshot),
            );
        }
      }
    );
  }

  getTasks(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents.map(
      (DocumentSnapshot doc) => new Task(title: doc["name"], time: doc["time"], due: doc["due"])
    ).toList();
  }
}