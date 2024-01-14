//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
 // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  Future<User?> signIn(String email, String password) async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Hata oluştu: $e");
      return null;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Hata oluştu: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print("Çıkış yaparken hata oluştu: $e");
    }
  }
}
