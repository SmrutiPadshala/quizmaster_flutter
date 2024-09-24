import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quizmaster/screen/home.dart';
import 'package:quizmaster/screen/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizmaster/screen/question.dart';
import 'package:quizmaster/screen/quizintro.dart';
import 'package:quizmaster/services/localdb.dart';

// SHA1: F2:8E:D8:1C:43:CE:93:65:9B:5C:EC:88:24:75:7C:C1:57:02:4A:B6
// SHA-256: 0A:27:97:BB:68:15:90:65:B5:CD:F4:22:53:3B:F8:0B:6A:03:4B:97:44:7D:8C:DC:99:1C:50:BC:D5:31:2C:5D
//./gradlew signingReport(cd android)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA63RybNjSyj1-C6odGM1zdWslsji_E_KU",
      appId: "1:510068712810:android:bbe2ed6ff56a7727edb113",
      messagingSenderId: "510068712810",
      projectId: "quizmaster-697a0",
      storageBucket: "quizmaster-697a0.appspot.com",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  bool isLogIn = false;

  getLoggedInState() async{
    await LocalDB.getUserID().then((value){
      setState((){
        isLogIn = value.toString() != "null" ;
      });
    });
  }



  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogIn ? Home():Question(),
    )
    );
  }
}