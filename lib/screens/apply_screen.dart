import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/main_screen.dart';

final _fire = FirebaseFirestore.instance.collection('applications');

class ApplyScreen extends StatelessWidget {
  String doc_id;
  ApplyScreen({required this.doc_id});

  @override
  Widget build(BuildContext context) {
    String name = '',
        email = '',
        phone = '',
        location = '',
        education = '',
        skills = '',
        portfolio = '';

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Text('Personal Details: '),
            Text('Name'),
            TextField(
              onChanged: (value) {
                name = value;
              },
            ),
            Text('Email: '),
            TextField(
              onChanged: (value) {
                email = value;
              },
            ),
            Text('Phone number: '),
            TextField(
              onChanged: (value) {
                phone = value;
              },
            ),
            Text('Place: '),
            TextField(
              onChanged: (value) {
                location = value;
              },
            ),
            Text('Education Details: '),
            TextField(
              onChanged: (value) {
                education = value;
              },
            ),
            Text('Skills'),
            TextField(
              onChanged: (value) {
                skills = value;
              },
            ),
            Text('Portfolios'),
            TextField(
              onChanged: (value) {
                portfolio = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                DocumentReference doc =
                    _fire.doc(doc_id).collection('applicants').doc();

                doc.set({
                  'name': name,
                  'email': email,
                  'phone': phone,
                  'place': location,
                  'edu': education,
                  'skills': skills,
                  'portfolio': portfolio,
                });

                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Submit Application'),
            ),
          ],
        ),
      ),
    );
  }
}
