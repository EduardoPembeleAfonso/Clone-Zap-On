// ignore_for_file: unrelated_type_equality_checks

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_zap_on/screens/Signup/register_confirmation.dart';
import 'package:line_icons/line_icons.dart';

import '../Dashboard/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _callsign = TextEditingController();
  final _phone = TextEditingController();
  final _numberZap = TextEditingController();

  final transitionType = ContainerTransitionType.fade;

  @override
  void dispose() {
    _callsign.dispose();
    _phone.dispose();
    _numberZap.dispose();
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
        body: FirstWidget(
          formKey: _formKey,
          callsign: _callsign,
          phone: _phone,
          numberZap: _numberZap,
          widget: widget,
        ));
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget(
      {super.key,
      required GlobalKey<FormState> formKey,
      required TextEditingController callsign,
      required TextEditingController phone,
      required TextEditingController numberZap,
      required this.widget})
      : _formKey = formKey,
        _callsign = callsign,
        _phone = phone,
        _numberZap = numberZap;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _callsign;
  final TextEditingController _phone;
  final TextEditingController _numberZap;
  final SignUp widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _callsign,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    LineIcons.globe,
                                    size: 30,
                                    color: Color(0xFF1cb5f1),
                                  ),
                                ),
                                hintText: 'Indicativo',
                                hintStyle: TextStyle(color: Color(0xFF1cb5f1)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFF1cb5f1))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFF1cb5f1))),
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
                                      ? 'O telemovel nao pode estar vazio'
                                      : null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _numberZap,
                                decoration: const InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        // LineIcons.caretRight,
                                        Icons.contact_mail_outlined,
                                        size: 30,
                                        color: Color(0xFF1cb5f1),
                                      ),
                                    ),
                                    hintText: 'Numero ZAPi',
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
                                      ? 'O numero ZAPi nao pode estar vazio'
                                      : null;
                                })
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        margin: const EdgeInsets.only(top: 125),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const RegisterConfirmation())));
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF9ab236)),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF282f37)),
                                        textStyle: MaterialStatePropertyAll(
                                            TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    child: const Text('Registrar'))),
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
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ))),
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
}
