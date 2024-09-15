import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img/logo.png",width: 350,height: 300,),
          SizedBox(height: 35,),
          Text("Welcome\n To QuizMaster Quiz App", style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 12,),
          //ElevatedButton(onPressed: (){}, child: Text("Continue with Google")),
          SignInButton(Buttons.GoogleDark, onPressed: () {}),
          SizedBox(height: 10,),
          Text("By continuing, You are agree with our Terms & Conditions",style: TextStyle(color: Colors.white)),

        ],),),
    );
  }
}
