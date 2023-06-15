// all packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';

import '../Dashboard/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInSTate();
}

class _SignInSTate extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _callsign = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _callsign.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Login'),
        toolbarHeight: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is UnAuthenticated) {
          return SingleChildScrollView(
            reverse: false,
            child: Container(
              color: const Color(0xFF029af0),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _callsign,
                                    style: const TextStyle(),
                                    decoration: const InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(top: 0, right: 10),
                                        child: Icon(
                                          LineIcons.globe,
                                          size: 30,
                                          color: Color(0xFF1cb5f1),
                                        ),
                                      ),
                                      hintText: 'Indicativo',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF1cb5f1),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF1cb5f1))),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF1cb5f1))),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return value != null && value != ''
                                          ? 'Indicativo nao pode estar vazio!'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _phone,
                                    decoration: const InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            LineIcons.phone,
                                            size: 30,
                                            color: Color(0xFF1cb5f1),
                                          ),
                                        ),
                                        hintText: 'Telemovel',
                                        hintStyle:
                                            TextStyle(color: Color(0xFF1cb5f1)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF1cb5f1))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF1cb5f1)))),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return value != null && value != ''
                                          ? 'O telemovel nao pode estar vazio!'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _password,
                                    decoration: const InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(LineIcons.lock,
                                              size: 30,
                                              color: Color(0xFF1cb5f1)),
                                        ),
                                        hintText: 'Palavra-passe',
                                        hintStyle:
                                            TextStyle(color: Color(0xFF1cb5f1)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF1cb5f1))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF1cb5f1)))),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return value != null && value != ''
                                          ? 'A Palavra-passe nao pode estar vazia'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      width: 360,
                                      child: const Text(
                                        'Recuperar palavra-passe',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              margin: const EdgeInsets.only(top: 106),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: const ElevatedButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xFF9ab236)),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xFF282f37)),
                                          textStyle: MaterialStatePropertyAll(
                                              TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      child: Text('Entrar'),
                                    ),
                                  ),
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      })),
    );
  }
}
