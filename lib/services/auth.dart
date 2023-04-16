import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChange();
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  @override
  Stream<User?> authStateChange() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> logout() async => await _firebaseAuth.signOut();
}
