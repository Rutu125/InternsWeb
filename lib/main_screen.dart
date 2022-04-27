import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intern_web/home_screen.dart';
import 'package:intern_web/screens/internship_details_window.dart';
import 'package:intern_web/start_page.dart';

final _auth = FirebaseAuth.instance;
User? loginUser = _auth.currentUser;
final _firestore = FirebaseFirestore.instance.collection('users');
final _application = FirebaseFirestore.instance.collection('applications');
const storage = FlutterSecureStorage();

void getCurrentUser() async {
  try {
    final user = _auth.currentUser;
    if (user != null) {
      loginUser = user;
    }
  } catch (e) {
    print("Error");
    print(e);
  }
}

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interns Web'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Text(
                  'Interns Web',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            DrawerButton(loginUser?.email),
            // LoginContainer(loginUser?.email, 'userName'),
            GestureDetector(
              child: DrawerButton('Sign Out'),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, StartPage.id);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _application.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print('Error..........');
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orange,
                  ),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return InternshipCard(
                    apply: data['apply_by'],
                    domain: data['domain'],
                    duration: data['duration'],
                    stipend: data['stipend'],
                    companyName: data['company_name'],
                    workWhere: data['work_where'],
                    sDate: data['startD'],
                    iDes: data['internDes'],
                    cDes: data['companyDes'],
                    skills: data['skills'],
                    openings: data['openings'],
                    lDate: data['lastD'],
                    doc_id: data['doc_id'],
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  DrawerButton(this.text);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Text(
            text!,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class InternshipCard extends StatelessWidget {
  final String domain;
  final String sDate;
  final String duration;
  final String stipend;
  final String lDate;
  final String cDes;
  final String iDes;
  final String skills;
  final String apply;
  final String openings;
  final String companyName;
  final String workWhere;
  final String doc_id;

  const InternshipCard(
      {required this.duration,
      required this.domain,
      required this.stipend,
      required this.companyName,
      required this.openings,
      required this.skills,
      required this.apply,
      required this.iDes,
      required this.cDes,
      required this.lDate,
      required this.sDate,
      required this.workWhere,
      required this.doc_id});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          await storage.write(key: 'doc_id', value: doc_id);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InternshipDetailsWindow(
                duration: duration,
                domain: domain,
                stipend: stipend,
                companyName: companyName,
                openings: openings,
                skills: skills,
                apply: apply,
                iDes: iDes,
                cDes: cDes,
                lDate: lDate,
                sDate: sDate,
                workWhere: workWhere,
                doc_id: doc_id);
          }));
        },
        child: Column(
          children: [
            Text(domain),
            Text(companyName),
            Text(workWhere),
            Text(stipend),
            Text(duration),
            Text(apply),
          ],
        ),
      ),
    );
  }
}

// class LoginContainer extends StatelessWidget {
//   LoginContainer(this.userEmail, this.userName);
//
//   final String? userEmail;
//   final String? userName;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(stream: , builder: builder);
//   }
// }
