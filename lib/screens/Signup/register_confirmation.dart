// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_clone_zap_on/screens/Signup/register_password.dart';

// screens
import '../Dashboard/dashboard.dart';

class RegisterConfirmation extends StatefulWidget {
  const RegisterConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterConfirmation> createState() => _RegisterConfirmationState();
}

class _RegisterConfirmationState extends State<RegisterConfirmation> {
  final _formKey = GlobalKey<FormState>();
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Signup'),
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
                                  image: AssetImage('assets/smartphone.png'),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Ira receber uma sms com um codigo de acesso.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Por favor insira o mesmo no campo abaixo.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 350,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _code,
                                          decoration: const InputDecoration(
                                              prefixIcon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(Icons.apps,
                                                    // Icons.aod_outlined
                                                    size: 30,
                                                    color: Color(0xFF1cb5f1)),
                                              ),
                                              hintText: 'Codigo de acesso',
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF1cb5f1)),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color:
                                                              Color(
                                                                  0xFF1cb5f1))),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFF1cb5f1)))),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            return value != null
                                                ? 'Por favor insira o codigo'
                                                : null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            width: 360,
                                            child: const Text(
                                              'Reenviar sms com codigo de acesso',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 110,
                                    margin: const EdgeInsets.only(top: 79),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const RegisterPassword())));
                                            },
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
                                            child: const Text('Confirmar'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 25),
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ));
  }
}
