import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp_api/components/no_account_text.dart';
import 'package:movieapp_api/screens/signin_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
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
              SizedBox(height: 20),
              Text(
                "Welcome To IMOVE.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password  \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SignForm(),
              SizedBox(height: 20),
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
                      child: SvgPicture.asset("assets/icons/google-icon.svg", height: 15.0),
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
                      child: SvgPicture.asset("assets/icons/facebook-2.svg", height: 15.0),
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
                      child: SvgPicture.asset("assets/icons/twitter.svg",height: 15.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              NoAccountText(),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }
}