import 'package:flutter/material.dart';
import 'package:shesecure/pages/auth.dart';
import 'package:shesecure/pages/createPosts.dart';
import 'package:shesecure/pages/homepage.dart';
import 'package:shesecure/pages/login_page.dart';
import 'package:shesecure/pages/map.dart';
import 'package:shesecure/pages/phone.dart';
import 'package:shesecure/pages/showposts.dart';
import 'package:shesecure/pages/sign.dart';
import 'package:shesecure/pages/signup_page.dart';
import 'package:shesecure/theme.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(
MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        // '/':(context) => LoadState(),
       
        '/home':(context) => homepage(),
        '/map' : (context) => map(),
        '/auth': (context)=> auth(),
        '/phone':(context) => phone(),
        '/login': (context) => login_page(),
        '/signup': (context) => signup_page(),
        '/createpost':(context) => sendpost(),
        '/showpost' : (context)=> showposts()
        
      },
    )
  );
}

