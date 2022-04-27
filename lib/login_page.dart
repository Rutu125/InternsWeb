import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intern_web/employer_main_screen.dart';
import 'package:intern_web/home_screen.dart';
import 'package:intern_web/main_screen.dart';
import 'package:intern_web/registration_screen.dart';
import 'constants.dart';
import 'components/buttonWidget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatelessWidget {
  LoginPage(this.isCompany);
  bool isCompany;

  static String id = 'login_page';

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String password = '';
    String email = '';
    String errorText = 'Error';

    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 34, right: 34, bottom: 34, top: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Welcome\nBack',
                style: TextStyle(fontSize: 40.0),
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
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Email',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 15.0,
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 15.0,
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ButtonWidget(
                widthLen: double.infinity,
                onpressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (user != null) {
                      print("Logged In");

                      !isCompany
                          ? Navigator.pushNamed(context, MainScreen.id)
                          : Navigator.pushNamed(context, EmployerMainScreen.id);
                    }
                  } catch (e) {
                    print('Error');
                    print(e);

                    if (e.toString() ==
                        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
                      errorText = 'Invalid Password';
                    } else if (e.toString() ==
                        '[firebase_auth/invalid-email] The email address is badly formatted.') {
                      errorText = 'Invalid Email Address';
                    } else if (e.toString() ==
                        '[firebase_auth/unknown] Given String is empty or null') {
                      errorText = 'Fields are blank';
                    } else if (e.toString() ==
                        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                      errorText = 'Account not found';
                    } else {
                      errorText = 'Error';
                    }

                    Alert(
                        context: context,
                        title: 'Error',
                        desc: errorText,
                        buttons: [
                          DialogButton(
                            child: Text(
                              'Cool',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.deepOrangeAccent,
                          ),
                        ]).show();
                  }
                },
                name: Text('Log In'),
                colourName: Colors.teal,
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 15.0,
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonWidget(
                widthLen: double.infinity,
                onpressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                name: Text('Sign Up'),
                colourName: Colors.red,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
