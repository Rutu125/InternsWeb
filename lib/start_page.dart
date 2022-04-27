import 'package:flutter/material.dart';
import 'package:intern_web/employer_home_screen.dart';
import 'package:intern_web/home_screen.dart';

class StartPage extends StatefulWidget {
  static String id = 'start_page';
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  // AnimationController scaleController;
  // Animation <double> scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    // scaleController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    // ..addListener((status) {
    //   if(status == AnimationStatus)
    // })
  }

  @override
  Widget build(BuildContext context) {
    bool isTapped = false;

    return Scaffold(
      body: Container(
        color: Color(0xFF0F222D),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/Wave-PNG-Picture.png')),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('images/logospy.png'))),
            Text(
              'Are you looking for Interns?',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isTapped = value;
                });
              },
              onTap: () {
                Navigator.pushNamed(context, EmployeeHomeScreen.id);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                height: isTapped ? 55 : 60,
                width: isTapped ? 150 : 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(3, 7),
                      )
                    ]),
                child: Center(
                  child: Text(
                    "Employer",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            Text(
              'Are you looking for Internships?',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isTapped = value;
                });
              },
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                height: isTapped ? 55 : 60,
                width: isTapped ? 150 : 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(3, 7),
                      )
                    ]),
                child: Center(
                  child: Text(
                    "Employee",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
