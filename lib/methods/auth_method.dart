import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concurso_quiz_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<user> getUserDetails() async {
    user currentUser = _auth.currentUser! as user;

    DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(currentUser.id).get();
    return user.fromSnapshot(documentSnapshot);
    }
  }

