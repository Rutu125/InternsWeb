import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/create_application.dart';
import 'package:intern_web/screens/profile.dart';
import 'package:intern_web/screens/view_application.dart';
import 'package:intern_web/start_page.dart';

final _auth = FirebaseAuth.instance;

class EmployerMainScreen extends StatelessWidget {
  static String id = 'employer_main_screen';
  const EmployerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            GestureDetector(
                child: ListTile(
                  title: Text('Create a job Application'),
                ),
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateApplication();
                    }))),
            ListTile(
              title: Text('View the applications'),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewApplication();
              })),
            ),
            ListTile(
              title: Text('Signout'),
              onTap: () {
                _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return StartPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
