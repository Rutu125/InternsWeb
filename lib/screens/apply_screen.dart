import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/constants.dart';
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
      appBar: AppBar(
        title: Text('Apply Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                phone = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Phone number',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                location = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Place',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                education = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Education Details',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                skills = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Skills',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              onChanged: (value) {
                portfolio = value;
              },
              decoration: kTextFieldDecorationfor.copyWith(
                hintText: 'Portfolio',
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple),
                child: Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              onTap: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
