import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> addnotes({
  required String title,
  required String description,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection('notes').add({
      'title': title,
      'description': description,
      'userId': FirebaseAuth.instance.currentUser?.uid,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('note added successfully')));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
