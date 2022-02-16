import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {required this.onpressed, required this.name, required this.colourName});

  final Text name;
  final VoidCallback onpressed;
  final Color colourName;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colourName,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: MaterialButton(
        minWidth: 140.0,
        onPressed: onpressed,
        child: name,
      ),
    );
  }
}
