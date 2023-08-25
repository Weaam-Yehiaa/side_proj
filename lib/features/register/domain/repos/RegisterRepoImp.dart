import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:side_proj/features/register/domain/repos/register_repo.dart';
import 'package:side_proj/shared/errors/failures.dart';

 class RegisterRepoImp implements RegisterRepo{
  @override
   void  user_register(String email,String password)   {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print('RRRRegistration is done');
      print(value.user!.email.toString());
      //navigate to home as an admin
    }
    ).catchError((error){
      print('ERRORRRRRR'+ error.toString());
      RegistrationFailure(error.toString());

    });
  }

}