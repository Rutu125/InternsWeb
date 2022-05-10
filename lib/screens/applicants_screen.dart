import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance.collection('applications');

class ApplicantsScreen extends StatelessWidget {
  String doc_id;
  ApplicantsScreen({required this.doc_id});

  @override
  Widget build(BuildContext context) {
    final _fire = _firestore.doc(doc_id).collection('applicants');
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _fire.snapshots(),
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

              return ApplicantsWidget(
                skills: data['skills'],
                portfolio: data['portfolio'],
                education: data['edu'],
                location: data['place'],
                phone: data['phone'],
                email: data['email'],
                name: data['name'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class ApplicantsWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String location;
  final String education;
  final String portfolio;
  final String skills;

  const ApplicantsWidget(
      {required this.skills,
      required this.portfolio,
      required this.education,
      required this.location,
      required this.phone,
      required this.email,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.deepPurpleAccent,
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            phone,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            education,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            location,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            skills,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            portfolio,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
