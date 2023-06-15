import 'package:flutter/material.dart';

class OtherScreens extends StatefulWidget {
  const OtherScreens({Key? key}) : super(key: key);

  @override
  State<OtherScreens> createState() => _OtherScreensState();
}

class _OtherScreensState extends State<OtherScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        // elevation: 0,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          'Só existem 2 telas, que são a página inicial e o guia de tv',
          style: TextStyle(
              color: Color(0xFF029af0), fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
