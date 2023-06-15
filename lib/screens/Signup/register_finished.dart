// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

// my screens
import 'package:flutter_clone_zap_on/screens/SignIn/signin.dart';
import '../Dashboard/dashboard.dart';

class RegisterFinished extends StatefulWidget {
  const RegisterFinished({Key? key}) : super(key: key);

  @override
  State<RegisterFinished> createState() => _RegisterFinished();
}

class _RegisterFinished extends State<RegisterFinished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Register Finished'),
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          reverse: false,
          child: Container(
              color: const Color(0xFF029af0),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(image: AssetImage('assets/logo.png')),
                    ),
                    // fazendo o form
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 409,
                        child: Column(
                          children: [
                            SizedBox(
                                child: Column(
                              children: const [
                                Image(
                                  image: AssetImage('assets/done.png'),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Registro confirmado.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Agora pode efectuar login na aplicacao.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 85),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: OpenContainer(
                                        transitionDuration:
                                            const Duration(seconds: 1),
                                        transitionType:
                                            ContainerTransitionType.fadeThrough,
                                        openBuilder: (context, action) =>
                                            const SignIn(),
                                        closedBuilder: (context,
                                                VoidCallback openContainer) =>
                                            ElevatedButton(
                                          onPressed: openContainer,
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color(0xFF9ab236)),
                                              foregroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color(0xFF282f37)),
                                              textStyle:
                                                  MaterialStatePropertyAll(
                                                      TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .w700))),
                                          child: const Text('Guardar'),
                                        ),
                                      )),
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Dashboard()));
                                      },
                                      child: const Text(
                                        'Continue como visitante',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ));
  }
}
