import 'package:flutter/material.dart';
import 'package:side_proj/features/login/presentation/login_screen.dart';
import 'package:side_proj/features/register/domain/repos/RegisterRepoImp.dart';
import 'package:side_proj/features/register/domain/repos/register_repo.dart';
import 'package:side_proj/shared/components.dart';

class RegisterScreenImpl extends StatefulWidget {

  @override
  State<RegisterScreenImpl> createState() => _RegisterScreenImplState();
}

class _RegisterScreenImplState extends State<RegisterScreenImpl> {
  bool visibility= true;

  bool clicked=false;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController= new TextEditingController();
    TextEditingController emailController= new TextEditingController();
    TextEditingController passwordController= new TextEditingController();
    RegisterRepoImp registerRepoImp=RegisterRepoImp();
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
      body:
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/register.jpg'),
              width: MediaQuery.sizeOf(context).width,
              height:MediaQuery.sizeOf(context).height/4.5 ,
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController:  userNameController,
                hintText: 'User Name',
                textInputType: TextInputType.name
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController:  emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController:  passwordController,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                suffix:visibility?Icon(
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
              height: 25,
            ),
            customizedButton(
                text: 'Sign up',
                onPressed:()=>
                    registerRepoImp.user_register(
                      emailController.text,
                      passwordController.text,
                    )
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account?',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                    );
                  },
                  child: Text(
                    ' Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
          ],
      ),
       ),
    );
  }
}

