import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intern_web/create_application.dart';
import 'package:intern_web/employer_main_screen.dart';
import 'package:intern_web/employer_register_page.dart';
import 'package:intern_web/employer_home_screen.dart';
import 'package:intern_web/home_screen.dart';
import 'package:intern_web/main_screen.dart';
import 'package:intern_web/registration_screen.dart';
import 'package:intern_web/screens/view_application.dart';
import 'package:intern_web/start_page.dart';
import 'themes.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

const storage = FlutterSecureStorage();

User? LoginUser = _auth.currentUser;

void getCurrentUser() async {
  try {
    final user = await _auth.currentUser;
    if (user != null) {
      LoginUser = user;
    }
    // String? token = await storage.read(key: 'employee');
    // print(token);
  } catch (e) {
    print("Error");
    print(e);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getCurrentUser();
  String? token = await storage.read(key: 'employee');
  print(token);
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  MyApp({required this.token});
  String? token;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      if (token == 'true') {
        return MaterialApp(
          // themeMode: ThemeMode.system,
          // theme: MyThemes.lightTheme,
          // darkTheme: MyThemes.darkTheme,
          initialRoute: MainScreen.id,
          routes: {
            EmployeeHomeScreen.id: (context) => EmployeeHomeScreen(),
            StartPage.id: (context) => StartPage(),
            LoginPage.id: (context) => LoginPage(true),
            MainScreen.id: (context) => MainScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            EmployerMainScreen.id: (context) => EmployerMainScreen(),
            EmployerRegisterPage.id: (context) => EmployerRegisterPage(),
            ViewApplication.id: (context) => ViewApplication(),
          },
        );
      } else {
        return MaterialApp(
          // themeMode: ThemeMode.system,
          // theme: MyThemes.lightTheme,
          // darkTheme: MyThemes.darkTheme,
          initialRoute: EmployerMainScreen.id,
          routes: {
            EmployeeHomeScreen.id: (context) => EmployeeHomeScreen(),
            StartPage.id: (context) => StartPage(),
            LoginPage.id: (context) => LoginPage(true),
            MainScreen.id: (context) => MainScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            EmployerMainScreen.id: (context) => EmployerMainScreen(),
            EmployerRegisterPage.id: (context) => EmployerRegisterPage(),
            ViewApplication.id: (context) => ViewApplication(),
          },
        );
      }
    } else {
      return MaterialApp(
        // themeMode: ThemeMode.system,
        // theme: MyThemes.lightTheme,
        // darkTheme: MyThemes.darkTheme,
        initialRoute: StartPage.id,
        routes: {
          EmployerMainScreen.id: (context) => EmployerMainScreen(),
          EmployerRegisterPage.id: (context) => EmployerRegisterPage(),
          EmployeeHomeScreen.id: (context) => EmployeeHomeScreen(),
          StartPage.id: (context) => StartPage(),
          HomeScreen.id: (context) => HomeScreen(),
          LoginPage.id: (context) => LoginPage(true),
          MainScreen.id: (context) => MainScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      );
    }
  }
}
