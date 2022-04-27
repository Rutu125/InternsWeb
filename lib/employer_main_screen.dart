import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/create_application.dart';
import 'package:intern_web/screens/profile.dart';
import 'package:intern_web/screens/view_application.dart';
import 'package:intern_web/start_page.dart';

final _auth = FirebaseAuth.instance;

class EmployerMainScreen extends StatefulWidget {
  static String id = 'employer_main_screen';
  const EmployerMainScreen({Key? key}) : super(key: key);

  @override
  State<EmployerMainScreen> createState() => _EmployerMainScreenState();
}

class _EmployerMainScreenState extends State<EmployerMainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Interns Web',
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.055,
                    )),
              ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Divider(
              thickness: 5,
              color: Colors.black54,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: JobCard(
                        'Create a job Application', 'applicationimg.jpg'),
                    onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CreateApplication();
                        }))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                GestureDetector(
                  child: JobCard('View the applications', 'view.png'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return ViewApplication();
                  })),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  'Signout',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
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

class JobCard extends StatelessWidget {
  String img;
  String name;
  JobCard(this.name, this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage('images/$img'),
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.018),
          ),
        ],
      ),
    );
  }
}
