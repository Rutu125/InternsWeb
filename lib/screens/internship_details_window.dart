import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intern_web/screens/apply_screen.dart';

const storage = FlutterSecureStorage();

class InternshipDetailsWindow extends StatefulWidget {
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

  const InternshipDetailsWindow(
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
  State<InternshipDetailsWindow> createState() =>
      _InternshipDetailsWindowState();
}

class _InternshipDetailsWindowState extends State<InternshipDetailsWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
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
                'Openings: ' + widget.openings,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Skills: ' + widget.skills,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Duration: ' + widget.duration,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Stipend: ' + widget.stipend,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Apply before: ' + widget.apply,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Company Description: ' + widget.cDes,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Intern Description: ' + widget.iDes,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Last Date: ' + widget.lDate,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              Text(
                'Start Date: ' + widget.sDate,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.deepPurple),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ApplyScreen(
                      doc_id: widget.doc_id,
                    );
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
