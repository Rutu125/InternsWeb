import 'package:flutter/material.dart';
import 'package:intern_web/home_screen.dart';
import 'package:intern_web/main_screen.dart';
import 'package:intern_web/registration_screen.dart';
import 'themes.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

User? LoginUser = _auth.currentUser;

void getCurrentUser() async {
  try {
    final user = await _auth.currentUser;
    if (user != null) {
      LoginUser = user;
    }
  } catch (e) {
    print("Error");
    print(e);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getCurrentUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: MainScreen.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          MainScreen.id: (context) => MainScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      );
    } else {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          LoginPage.id: (context) => LoginPage(),
          MainScreen.id: (context) => MainScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      );
    }
  }
}
