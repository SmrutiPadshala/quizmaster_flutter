import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import '../services/InternetCon.dart';
import '../services/firedb.dart';
import '../services/auth.dart';
import 'package:quizmaster/screen/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  String name='';
  bool login=false;

  @override
  void initState(){
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status){
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET"));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logo.png",
                width: 350,
                height: 300,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Welcome\n To QuizMaster Quiz App",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              SignInButton(Buttons.GoogleDark, onPressed: () async {
                await signWithGoogle();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));

              }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "By continuing, you agree with our Terms & Conditions",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();
      if (googleSignInAccount == null) {
        // User canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User? currentUser = FirebaseAuth.instance.currentUser;
        assert(currentUser?.uid == user.uid);

        print(user);
        FireDB().createNewUser(
          user.displayName ?? 'No Name',
          user.email ?? 'No Email',
          user.photoURL ?? 'No Photo',
          user.uid,
        );
      }
    } catch (e) {
      print("Error occurred during Google Sign-In");
      print(e);
    }
  }
}