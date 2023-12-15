import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getDisplayName(String? id) {
  // get display_name from firestore based on document id
  String? displayName;
  FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      displayName = data['display_name'];
    } else {
      print('Document does not exist on the database');
    }
  }).catchError((error) {
    print('Error getting document: $error');
  });
  return displayName;
}
