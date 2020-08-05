import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_chat/locator.dart';
import 'package:open_chat/models/user.dart';
import 'package:open_chat/services/repository_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final RepositoryService _repositoryService = locator<RepositoryService>();

  AuthService()
      : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<User> getUser() async {
    var firebaseUser = await _firebaseAuth.currentUser();
    print(firebaseUser.uid);
    var user = await _repositoryService.getUser(firebaseUser.uid);

    if (user == null) {
      user = User(
        id: firebaseUser.uid,
        email: firebaseUser.email,
        name: firebaseUser.email.split('@')[0],
        imgUrl: 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
      );
      _repositoryService.registerUser(user);
    }

    return user;
  }

}