import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createNewUser(
      String name, String email, String photoUrl, String uid) async {
    final User? currentUser = _auth.currentUser;
    if (currentUser == null) return;

    if (await getUser()) {
      print("User already exists");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "money": "55555",
      }).then((_) {
        print("User registered successfully");
      }).catchError((e) {
        print("Failed to register user: $e");
      });
    }
  }

  Future<bool> getUser() async {
    final User? currentUser = _auth.currentUser;
    if (currentUser == null) return false;

    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get();
    return docSnapshot.exists;
  }
}

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}