import 'package:flutter/material.dart';
import 'package:movieapp_api/components/form_error.dart';
import 'package:movieapp_api/components/no_account_text.dart';
import 'package:movieapp_api/screens/signin_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "forgot_password";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
      child: Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
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
      "Forgot Password",
      style: TextStyle(
      fontSize: 28,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      "Please enter your email and we will send \nyou a link to return to your account",
      textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
    ForgotPassForm(),
    ],
    ),
    ),
    ),
    ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains("Please Enter your email")) {
                setState(() {
                  errors.remove("Please Enter your email");
                });
              } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) &&
                  errors.contains("Please Enter Valid Email")) {
                setState(() {
                  errors.remove("Please Enter Valid Email");
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains("Please Enter your email")) {
                setState(() {
                  errors.add("Please Enter your email");
                });
              } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) &&
                  !errors.contains("Please Enter Valid Email")) {
                setState(() {
                  errors.add("Please Enter Valid Email");
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          SizedBox(height: 30),
          FormError(errors: errors),
          SizedBox(height: 10),
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      }
                    },
                    child: Center(
                      child: Text("Continue", style: TextStyle(fontSize: 18,color:Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  )
              )),
          SizedBox(height: 10),
          NoAccountText(),
        ],
      ),
    );
  }
}