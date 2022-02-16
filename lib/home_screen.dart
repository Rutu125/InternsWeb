import 'package:flutter/material.dart';
import 'package:intern_web/login_page.dart';
import 'package:intern_web/registration_screen.dart';
import 'components/buttonWidget.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 34, right: 34, bottom: 34, top: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interns Web',
              style: TextStyle(fontSize: 30.0),
            ),
            Image(image: AssetImage('images/logo2.png')),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      onpressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      name: Text(
                        'Register',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      colourName: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ButtonWidget(
                      onpressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                      name: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      colourName: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
