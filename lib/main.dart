import 'package:flutter/material.dart';
import 'package:quizmaster/screen/login.dart';
// SHA1: F2:8E:D8:1C:43:CE:93:65:9B:5C:EC:88:24:75:7C:C1:57:02:4A:B6
// SHA-256: 0A:27:97:BB:68:15:90:65:B5:CD:F4:22:53:3B:F8:0B:6A:03:4B:97:44:7D:8C:DC:99:1C:50:BC:D5:31:2C:5D
//./gradlew signingReport(cd android)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
