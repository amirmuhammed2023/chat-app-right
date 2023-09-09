import 'package:flutter/material.dart';
import 'package:onetwo/pages/chat.dart';
import 'package:onetwo/pages/log.dart';
import 'package:onetwo/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp( scholarr());
}

class scholarr extends StatelessWidget {
  const scholarr({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: { 
        signuppage.iid :(context) => signuppage(),
        loggg.id :(context) => loggg(),
        chatpage.idddd :(context) => chatpage(),
      },
      home: loggg(),
    );
  }
}