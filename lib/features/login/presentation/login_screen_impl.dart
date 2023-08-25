import 'package:flutter/material.dart';
import 'package:side_proj/features/login/domain/repos/login_repo.dart';
import 'package:side_proj/features/login/domain/repos/login_repo_impl.dart';

import '../../../shared/components.dart';

class LoginScreenImpl extends StatefulWidget {
  @override
  State<LoginScreenImpl> createState() => _LoginScreenImplState();
}

class _LoginScreenImplState extends State<LoginScreenImpl> {
  bool visibility= true;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController= new TextEditingController();
    TextEditingController passwordController= new TextEditingController();
    LoginRepoImp loginRepoImp=LoginRepoImp();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'POS System',
          style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.black,
              size:35,
              weight: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/login.jpg'),
              width: MediaQuery.sizeOf(context).width,
              height:MediaQuery.sizeOf(context).height/4.5 ,
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController:  emailController,
                hintText: 'User Name',
                textInputType: TextInputType.name
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController: passwordController,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                suffix: visibility?Icon(
                  Icons.visibility_outlined,
                  color: Colors.grey,
                )
                    :Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                secure: visibility,
                show: (){
                  setState(() {
                    visibility=!visibility;
                  });
                }
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            customizedButton(
              text: 'Sign in',onPressed: (){
                loginRepoImp.user_login(
                  emailController.text,
                  passwordController.text,
                );
            },),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:MediaQuery.sizeOf(context).width/2.75 ,
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.grey[300]),
                ),
                Text(
                  '      or     ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600]
                  ),
                ),
                SizedBox(
                  width:MediaQuery.sizeOf(context).width/2.75 ,
                  child: Divider(
                      thickness: 1.5,
                      color: Colors.grey[300]),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            googleButton(()=>loginRepoImp.signInWithGoogle()),

          ],
        ),
      ),
    );
  }
}
