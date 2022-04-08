import 'package:flutter/material.dart';
import 'package:movieapp_api/screens/signin_screen.dart';
import 'package:movieapp_api/screens/signup_screen.dart';

class WelcomePage extends StatelessWidget {
  static String routeName = "welcome";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Welcome to IMOVE.',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40
                        ),
                      )),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Image(
                        image: AssetImage(
                          'assets/images/clapperboard.png',
                        ),
                        height: 300.0,
                        width: 300.0,
                      ),
                    ),
                    SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                          height: 50,
                          width: 320,

                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF464646)
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()),);
                            },
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(fontSize: 18,color: Color(0xFFcccccf), fontWeight: FontWeight.bold),),
                            ),
                          )
                      )),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                          height: 50,
                          width: 320,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xffffb421),
                                  Color(0xFFff7521)
                                ]
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => SignInScreen()),);
                            },
                            child: Center(
                              child: Text("Sign In", style: TextStyle(fontSize: 18,color:Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          )
                      )),
                    SizedBox(height: 30,),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}