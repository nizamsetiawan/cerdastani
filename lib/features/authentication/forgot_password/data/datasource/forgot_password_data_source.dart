import 'package:firebase_auth/firebase_auth.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<void> forgotPassword(String email);
}

class ForgotPasswordDataSourceImplements
    extends ForgotPasswordRemoteDataSource {
  final FirebaseAuth auth;

  ForgotPasswordDataSourceImplements({required this.auth});

  @override
  Future<void> forgotPassword(String email) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      throw "Something went wrong, please try again";
    }
  }
}
