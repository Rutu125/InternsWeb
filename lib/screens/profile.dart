import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          child: Image.network('https://picsum.photos/500/200'),
          height: 100,
          width: double.infinity,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Card(
                child: Text('Experience'),
              ),
              Card(
                child: Text('Education'),
              ),
              Card(
                child: Text('Skills'),
              ),
              Card(
                child: Text(''),
              ),
            ],
          ),
        ),
        Positioned(
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/200'),
            radius: 50,
          ),
          top: 50,
          left: 50,
        ),
      ]),
    );
  }
}
