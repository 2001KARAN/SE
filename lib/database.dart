/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {

  late String name;
  late String email;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

// Add data in firebase

Future<void> addUser() {
  FirebaseAuth auth = FirebaseAuth.instance;

  String uid = auth.currentUser!.uid.toString();
  .add({
    'name' : name,
    'email': email,
  })
  
}
  }
}


/* Future<void> userSetup(String name, String Email) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  String uid = auth.currentUser!.uid.toString();

  users.doc(uid).set({
    'Name': name,
    //'Phone no': Phone,
    'Email': Email,
    'uid': uid
  });

  return;
} */
 */