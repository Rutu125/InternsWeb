import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/employer_register_page.dart';
import 'package:intern_web/login_page.dart';
import 'package:intern_web/registration_screen.dart';
import 'components/buttonWidget.dart';

class EmployeeHomeScreen extends StatelessWidget {
  static String id = 'employer_home_screen';
  const EmployeeHomeScreen({Key? key}) : super(key: key);

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
            SizedBox(
              height: 70.0,
            ),
            Image(image: AssetImage('images/logo1.jpg')),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Get Interns in an Instant',
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      widthLen: 150.0,
                      onpressed: () {
                        Navigator.pushNamed(context, EmployerRegisterPage.id);
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
                      widthLen: 150.0,
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(true)));
                      },
                      name: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
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
