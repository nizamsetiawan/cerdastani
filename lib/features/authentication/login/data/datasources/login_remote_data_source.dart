
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class LoginRemoteDataSource {
  Future< UserCredential> loginWithEmailAndPassword(String email, String password);
  Future< UserCredential?> loginWithGoogleSignIn();
}

class LoginRemoteDataSourceImplements extends LoginRemoteDataSource{
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  LoginRemoteDataSourceImplements({required this.auth, required this.googleSignIn});

  @override
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) {
    try{
      return auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException{
      throw "Something went wrong, please try again";
    }
  }

  @override
  Future<UserCredential?> loginWithGoogleSignIn() async {
    try {
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();
      if (userAccount == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await auth.signInWithCredential(credential);
    } on FirebaseAuthException {
      throw "Something went wrong, please try again";
    }
  }
  }
