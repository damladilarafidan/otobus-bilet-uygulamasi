import 'package:booking/pages/search/payment_page.dart';
import 'package:booking/pages/search/search_page.dart';
import 'package:booking/utils/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VeppoApp());
}

class VeppoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
       
      ),
      home: LoginPage(),
    );
  }
}
