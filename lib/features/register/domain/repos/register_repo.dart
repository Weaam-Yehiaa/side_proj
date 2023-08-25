import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:side_proj/shared/errors/failures.dart';

abstract class RegisterRepo{
   void user_register(String email,String password);
 // Future<Either<Failure,void>>user_register();
}