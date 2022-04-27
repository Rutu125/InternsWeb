import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/screens/applicants_screen.dart';

final _firestore = FirebaseFirestore.instance.collection('applications');

class ViewApplication extends StatelessWidget {
  static String id = 'view_application';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('View Applications'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print('Error..........');
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black54,
                ),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Application_card(
                  openings: data['openings'],
                  skills: data['skills'],
                  stipend: data['stipend'],
                  duration: data['duration'],
                  domain: data['domain'],
                  apply_by: data['apply_by'],
                  company_des: data['companyDes'],
                  internDes: data['internDes'],
                  last_date: data['lastD'],
                  start_date: data['startD'],
                  work_where: data['work_where'],
                  doc_id: data['doc_id'],
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class Application_card extends StatelessWidget {
  final String apply_by;
  final String company_des;
  final String domain;
  final String duration;
  final String internDes;
  final String last_date;
  final String openings;
  final String skills;
  final String start_date;
  final String stipend;
  final String work_where;
  final String doc_id;

  const Application_card({
    required this.openings,
    required this.skills,
    required this.stipend,
    required this.duration,
    required this.domain,
    required this.apply_by,
    required this.company_des,
    required this.internDes,
    required this.last_date,
    required this.start_date,
    required this.work_where,
    required this.doc_id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ApplicantsScreen(
            doc_id: doc_id,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.deepPurpleAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Openings: ' + openings,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Skills: ' + skills,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Duration: ' + duration,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Domain: ' + domain,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Stipend: ' + stipend,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Apply by: ' + apply_by,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Company Description: ' + company_des,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Intern Description: ' + internDes,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Last Date: ' + last_date,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
            Text(
              'Start Date: ' + start_date,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class application {
//   final String apply_by;
//   final String company_des;
//   final String domain;
//   final String duration;
//   final String internDes;
//   final String last_date;
//   final String openings;
//   final String skills;
//   final String start_date;
//   final String stipend;
//
//   const application(
//       {required this.openings,
//       required this.skills,
//       required this.stipend,
//       required this.duration,
//       required this.domain,
//       required this.apply_by,
//       required this.company_des,
//       required this.internDes,
//       required this.last_date,
//       required this.start_date});
// }

// const application_list = [
//   application(
//       openings: "1",
//       skills: 'skills',
//       stipend: 'stipend',
//       duration: 'duration',
//       domain: 'domain',
//       apply_by: 'apply_by',
//       company_des: 'company_des',
//       internDes: 'internDes',
//       last_date: 'last_date',
//       start_date: 'start_date'),
// ];
