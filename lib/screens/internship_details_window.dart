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
      body: Container(
        child: Column(
          children: [
            Text(widget.openings),
            Text(widget.skills),
            Text(widget.duration),
            Text(widget.stipend),
            Text(widget.apply),
            Text(widget.cDes),
            Text(widget.iDes),
            Text(widget.lDate),
            Text(widget.sDate),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ApplyScreen(
                      doc_id: widget.doc_id,
                    );
                  }));
                },
                child: Text("Apply")),
          ],
        ),
      ),
    );
  }
}
