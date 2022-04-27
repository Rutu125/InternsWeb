import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {required this.onpressed,
      required this.name,
      required this.colourName,
      required this.widthLen});

  final Text name;
  final VoidCallback onpressed;
  final Color colourName;
  final double widthLen;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colourName,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: MaterialButton(
        minWidth: widthLen,
        onPressed: onpressed,
        child: name,
      ),
    );
  }
}
