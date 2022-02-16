import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/buttonWidget.dart';

class LoginPage extends StatelessWidget {
  static String id = 'login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Interns Web",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: kTextFieldDecoration,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: kTextFieldDecoration,
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
