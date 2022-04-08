import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp_api/screens/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
        body: SafeArea(
    child: SizedBox(
    width: double.infinity,
    child: Padding(
    padding:
    EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
    child: Column(
    children: [
    SizedBox(height: 20),
      Image(
        image: AssetImage(
          'assets/images/clapperboard.png',
        ),
        height: 200.0,
        width: 200.0,
      ),
      SizedBox(height: 20),// 4%
    Text("Register Account", style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height: 1.5,
    ),),
    Text(
    "Complete your details or continue \nwith social media",
    textAlign: TextAlign.center,
    ),
    SizedBox(height: 10),
    SignUpForm(),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){},
        child: Container(
          margin:
          EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(12),
          height: (40),
          width: (40),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/google-icon.svg"),
        ),
      ),
      GestureDetector(
        onTap: (){},
        child: Container(
          margin:
          EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(12),
          height: (40),
          width: (40),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/facebook-2.svg"),
        ),
      ),
      GestureDetector(
        onTap: (){},
        child: Container(
          margin:
          EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(12),
          height: (40),
          width: (40),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/twitter.svg"),
        ),
      ),
    ],
    ),
    SizedBox(height: 20),
    Text(
    'By continuing your confirm that you agree \nwith our Term and Condition',
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.caption,
    )
    ],
    ),
    ),
    ),
    ),
    ),
    );
  }
}