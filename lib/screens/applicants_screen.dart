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
    return Column(
      children: [
        Text(name),
        Text(email),
        Text(phone),
        Text(education),
        Text(location),
        Text(skills),
        Text(portfolio),
      ],
    );
  }
}
