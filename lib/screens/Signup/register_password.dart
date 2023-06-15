// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

// my screens
import '../Signup/register_finished.dart';
import '../Dashboard/dashboard.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({Key? key}) : super(key: key);

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _passwordConfirmation = TextEditingController();

  bool showPassword = true;
  bool showPasswordConfirmation = true;

  @override
  void initState() {
    showPassword = true;
    showPasswordConfirmation = true;
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _passwordConfirmation.dispose();
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
                                image: AssetImage('assets/padlock.png'),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Por favor defina uma palavra-passe no campo abaixo.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
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
                                        keyboardType: TextInputType.text,
                                        controller: _password,
                                        obscureText: showPassword,
                                        decoration: InputDecoration(
                                            prefixIcon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(Icons.lock,
                                                  size: 30,
                                                  color: Color(0xFF1cb5f1)),
                                            ),
                                            hintText: 'Palavra-passe',
                                            hintStyle: const TextStyle(
                                                color: Color(0xFF1cb5f1)),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Color(0xFFe5e1de),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  showPassword = !showPassword;
                                                });
                                              },
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xFF1cb5f1))),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color(
                                                            0xFF1cb5f1)))),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          return value?.length == 0
                                              ? 'Por favor insira a palavra-passe'
                                              : null;
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: _passwordConfirmation,
                                        obscureText: showPasswordConfirmation,
                                        decoration: InputDecoration(
                                            prefixIcon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(Icons.lock,
                                                  size: 30,
                                                  color: Color(0xFF1cb5f1)),
                                            ),
                                            hintText: 'Repetir palavra-passe',
                                            hintStyle: const TextStyle(
                                                color: Color(0xFF1cb5f1)),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Color(0xFFe5e1de),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  showPasswordConfirmation =
                                                      !showPasswordConfirmation;
                                                });
                                              },
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xFF1cb5f1))),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color(
                                                            0xFF1cb5f1)))),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          return value != _password.text
                                              ? 'A palavra passe nao coincidi. '
                                              : null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  // height: 110,
                                  margin: const EdgeInsets.only(top: 98),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: OpenContainer(
                                            transitionDuration:
                                                const Duration(seconds: 1),
                                            transitionType:
                                                ContainerTransitionType
                                                    .fadeThrough,
                                            openBuilder: (context, action) =>
                                                const RegisterFinished(),
                                            closedBuilder: (context,
                                                    VoidCallback
                                                        openContainer) =>
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700))),
                                              child: const Text('Guardar'),
                                            ),
                                          )),
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
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
      ),
    );
  }
}
