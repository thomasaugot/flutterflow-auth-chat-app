import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB7IjwF7rw2L4mZLPN3-x7L8o5VkwdGbmM",
            authDomain: "flutter-talks-v1m89i.firebaseapp.com",
            projectId: "flutter-talks-v1m89i",
            storageBucket: "flutter-talks-v1m89i.appspot.com",
            messagingSenderId: "142555829541",
            appId: "1:142555829541:web:6a09f50ccd079325b276cc"));
  } else {
    await Firebase.initializeApp();
  }
}
