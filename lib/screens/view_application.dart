import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/screens/applicants_screen.dart';

final _firestore = FirebaseFirestore.instance.collection('applications');

class ViewApplication extends StatelessWidget {
  static String id = 'view_application';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.snapshots(),
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
      child: Column(
        children: [
          Text(openings),
          Text(skills),
          Text(duration),
          Text(domain),
          Text(stipend),
          Text(apply_by),
          Text(company_des),
          Text(internDes),
          Text(last_date),
          Text(start_date),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
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
