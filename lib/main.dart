import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temizlik_kapinda_app/models/haliModel.dart';
import 'package:temizlik_kapinda_app/models/provider.dart';
import 'package:temizlik_kapinda_app/screens/Hizmet.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';
import 'package:temizlik_kapinda_app/screens/UyeOl.dart';

import 'firebase/firebase_auth.dart';
///buuuuuuuuu
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Durumlar(),
      child: MaterialApp(
        routes: {
          '/': (context) => HomeScreen(),
          '/uyeol': (context) => UyeOlScreen(),
          '/giris': (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),

      ),
    );
  }
}

