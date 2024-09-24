import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'localdb.dart';

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
      }).then((value) async {
        await LocalDB.saveMoney("55555");
        await LocalDB.saveRank("-");
        await LocalDB.saveLevel("0");
        print("User registered successfully");
      }).catchError((e) {
        print("Failed to register user: $e");
      });
    }
  }

  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;

    String user = "";

    await FirebaseFirestore.instance.collection("users").doc(current_user!.uid).get().then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveMoney("999989");
      await LocalDB.saveRank("444");
      await LocalDB.saveLevel("45");
    });
    if(user.toString() == "null"){
      return false;
    }else{
      return true;
    }
  }
}
/* if (currentUser == null) return false;

    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get();
    return docSnapshot.exists;

 */