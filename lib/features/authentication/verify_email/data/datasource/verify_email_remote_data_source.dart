import 'package:firebase_auth/firebase_auth.dart';

abstract class VerifyEmailRemoteDataSource {
  Future<void> verifyEmailRemoteDataSource();
  Future<bool> checkEmailVerification();
}

class VerifyEmailDataSourceImplements extends VerifyEmailRemoteDataSource {
  final FirebaseAuth auth;

  VerifyEmailDataSourceImplements({required this.auth});

  @override
  Future<void> verifyEmailRemoteDataSource() async {
    try {
      return await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException {
      throw "Something went wrong, please try again";
    }
  }

  @override
  Future<bool> checkEmailVerification() async {
    try {
      await auth.currentUser?.reload();
      return auth.currentUser?.emailVerified ?? false;
    } catch (e) {
      throw "Gagal memeriksa status verifikasi.";
    }
  }

}
