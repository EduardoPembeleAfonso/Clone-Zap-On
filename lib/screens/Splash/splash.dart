import 'package:flutter/material.dart';

// import my screens
import '../SignIn/signin.dart';
import '../Signup/signup.dart';
import '../Dashboard/dashboard.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplahState();
}

class _SplahState extends State<Splash> {
  bool valueCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF029af0),
        title: const Text('Splash'),
        toolbarHeight: 0,
      ),
      body: Container(
        color: const Color(0xFF029af0),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 150),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 150,
              height: 150,
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFFe0e7ed)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Color(0xFF282f37)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.transparent)))),
                child: const Text(
                  'Entrar com Telemovel',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 40,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFFe0e7ed)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Color(0xFF282f37)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.transparent))),
                    textStyle: const MaterialStatePropertyAll(TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 17,
                        fontWeight: FontWeight.w500))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text('Entrar com facebook'),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: CheckboxListTile(
                activeColor: Colors.white,
                checkColor: const Color(0xFF282f37),
                side: const BorderSide(color: Colors.white),
                value: valueCheckBox,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                title: const Text(
                  'Manter sessao iniciada',
                  style: TextStyle(color: Color(0xFFffffff)),
                ),
                onChanged: (bool? newValue) {
                  setState(() {
                    valueCheckBox = newValue ?? false;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.all(10),
              color: const Color(0xFF097fc5),
              height: 40,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: SizedBox(
                    width: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Ainda nao tem conta ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Registre - se',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 17),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()));
                },
                child: const Text(
                  'Continue como visitante',
                  style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
