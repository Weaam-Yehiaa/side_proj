import 'package:flutter/material.dart';

Widget customizedTextFormField(
    {
      required TextEditingController textEditingController,
      required String hintText,
      required TextInputType textInputType,
      bool secure = false,
      Icon? suffix,
      void Function()? show,
    }
    )=>Material(
        elevation: 10.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.transparent, ),
        ),
       child: TextFormField(
        decoration:
        InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            suffixIcon: suffix != null? IconButton(
              icon: suffix,
              onPressed: show
          ) : null,
        ),
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: secure,
      ),
);
class customizedButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  customizedButton({
    required this.text,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
          width: MediaQuery.sizeOf(context).width,
    height: 60,
    child:   Material(
    elevation: 10.0,
    shadowColor: Colors.grey[200],
    color: Colors.black,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(color: Colors.transparent, ),
    ),
    child:   TextButton(
    onPressed:onPressed ,
    child:  Text(
        text,
        style: TextStyle(
        color: Colors.white,
        fontSize: 17,
         ),

        ),
       ),
      ),
     );
  }
}

class googleButton extends StatelessWidget {
  void Function()? onPressed;

  googleButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 60,
        child:   Material(
          elevation: 10.0,
          shadowColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent, ),
          ),
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/google.jpg'),
              ),
              Text(
                '   Continue with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
