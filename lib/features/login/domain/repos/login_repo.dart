import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo{
  void user_login(String email,String password);
  void signInWithGoogle();
}