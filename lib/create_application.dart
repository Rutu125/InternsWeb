import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_web/constants.dart';

final _fire = FirebaseFirestore.instance.collection('applications');

class CreateApplication extends StatelessWidget {
  static String id = 'create_application';

  @override
  Widget build(BuildContext context) {
    String domain = '',
        sDate = '',
        duration = '',
        stipend = '',
        lDate = '',
        cDes = '',
        iDes = '',
        skills = '',
        apply = '',
        openings = '',
        companyName = '',
        workWhere = '',
        doc_id = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Application'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Domain
                TextField(
                  onChanged: (value) {
                    companyName = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Company Name '),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    domain = value;
                  },
                  decoration:
                      kTextFieldDecorationfor.copyWith(hintText: 'Domain '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Start Date
                TextField(
                  onChanged: (value) {
                    sDate = value;
                  },
                  decoration:
                      kTextFieldDecorationfor.copyWith(hintText: 'Start Date '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Duration

                TextField(
                  onChanged: (value) {
                    duration = value;
                  },
                  decoration:
                      kTextFieldDecorationfor.copyWith(hintText: 'Duration '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextField(
                  onChanged: (value) {
                    workWhere = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Work from where (home/office) '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Stipend

                TextField(
                  onChanged: (value) {
                    stipend = value;
                  },
                  decoration:
                      kTextFieldDecorationfor.copyWith(hintText: 'Stipend'),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Apply by:

                TextField(
                  onChanged: (value) {
                    lDate = value;
                  },
                  decoration:
                      kTextFieldDecorationfor.copyWith(hintText: 'Apply by '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // About your Company:

                TextField(
                  onChanged: (value) {
                    cDes = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'About your Company'),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // About your Internship

                TextField(
                  onChanged: (value) {
                    iDes = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Number of Openings '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Skills Required:

                TextField(
                  onChanged: (value) {
                    skills = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Skills Required '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Who can apply

                TextField(
                  onChanged: (value) {
                    apply = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Who can apply '),
                ),
                SizedBox(
                  height: 20.0,
                ),

                //  Number of Openings

                TextField(
                  onChanged: (value) {
                    openings = value;
                  },
                  decoration: kTextFieldDecorationfor.copyWith(
                      hintText: 'Number of Openings '),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepPurpleAccent),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: () {
                    DocumentReference doc = _fire.doc();
                    print(doc.id);

                    doc.set({
                      'domain': domain,
                      'startD': sDate,
                      'duration': duration,
                      'stipend': stipend,
                      'lastD': lDate,
                      'companyDes': cDes,
                      'internDes': iDes,
                      'skills': skills,
                      'apply_by': apply,
                      'openings': openings,
                      'company_name': companyName,
                      'work_where': workWhere,
                      'doc_id': doc.id,
                    });

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
