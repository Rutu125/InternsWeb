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
      body: Container(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Domain

                Text(
                  'Company name: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    companyName = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                Text(
                  'Domain: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    domain = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Start Date

                Text(
                  'Start Date: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    sDate = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Duration

                Text(
                  'Duration: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    duration = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                Text(
                  'work from where (home/office): ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    workWhere = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Stipend

                Text(
                  'Stipend: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    stipend = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Apply by:

                Text(
                  'Apply by: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    lDate = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // About your Company:

                Text(
                  'About your Company: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    cDes = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // About your Internship

                Text(
                  'About the Internship: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    iDes = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Skills Required:

                Text(
                  'Skills Required: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    skills = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Who can apply

                Text(
                  'Who can apply: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    apply = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                //  Number of Openings

                Text(
                  'Number of Openings: ',
                  style: kTextDecoration,
                ),
                TextField(
                  onChanged: (value) {
                    openings = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                ElevatedButton(
                    onPressed: () {
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
                    child: Text('Submit')),
              ],
            ),
          )),
    );
  }
}
