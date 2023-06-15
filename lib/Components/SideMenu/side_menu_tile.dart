import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SideMenuTile extends StatefulWidget {
  const SideMenuTile({Key? key, required this.onData,}) : super(key: key);

  final void Function(int) onData;

  @override
  State<SideMenuTile> createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile> {
  late int isActive = 1;

  @override
  void initState() {
    super.initState();
    isActive = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white30,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 1 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                widget.onData(1);
                setState(() {
                  isActive == 1 ? isActive = 0 : isActive = 1;
                });
              },
              leading: const Icon(
                Icons.home_outlined,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Pagina Inicial',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 2 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                widget.onData(2);
                setState(() {
                  setState(() {
                    isActive == 2 ? isActive = 0 : isActive = 2;
                  });
                });
              },
              leading: const Icon(
                LineIcons.user,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Dados Pessoais',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 3 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  setState(() {
                    isActive == 3 ? isActive = 0 : isActive = 3;
                  });
                });
              },
              leading: const Icon(
                Icons.payment_outlined,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Gestao da Conta',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 4 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  setState(() {
                    isActive == 4 ? isActive = 0 : isActive = 4;
                  });
                });
              },
              leading: const Icon(
                Icons.movie_outlined,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Filmes',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 5 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                widget.onData(5);
                setState(() {
                  setState(() {
                    isActive == 5 ? isActive = 0 : isActive = 5;
                  });
                });
              },
              leading: const Icon(
                LineIcons.television,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Guia TV',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 6 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  setState(() {
                    isActive == 6 ? isActive = 0 : isActive = 6;
                  });
                });
              },
              leading: const Icon(
                Icons.snapchat_outlined,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Alertas',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 56,
              left: 0,
              width: isActive == 7 ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1cb5f1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  setState(() {
                    isActive == 7 ? isActive = 0 : isActive = 7;
                  });
                });
              },
              leading: const Icon(
                Icons.logout_outlined,
                size: 34,
                color: Colors.black,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
