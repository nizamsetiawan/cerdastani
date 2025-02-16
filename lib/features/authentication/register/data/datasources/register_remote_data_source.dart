import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<UserCredential> registerWithEmailAndPassword(String email, String password);
  Future<void> saveUserRecord(UserModel userModel);
}
class RegisterRemoteDataSourceImplements implements RegisterRemoteDataSource{
  final FirebaseAuth auth;
  final FirebaseFirestore _db;

  RegisterRemoteDataSourceImplements(this.auth, this._db);
  @override
  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async {
    try {
      final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException{
      throw "Something went wrong, please try again";
    }
  }

  @override
  Future<void> saveUserRecord(UserModel userModel)async {
    try {
      await _db.collection("users").doc(userModel.id).set(userModel.toJson());
    } on FirebaseAuthException{
      throw "Something went wrong, please try again";
    }
  }

}