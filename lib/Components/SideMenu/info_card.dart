import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.name})
      : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      color: const Color(0xFF1cb5f1),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 15, 63, 83),
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
