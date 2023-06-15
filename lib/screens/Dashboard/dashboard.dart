import 'dart:math';

import 'package:flutter_clone_zap_on/Components/other_screens.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

// all components
import 'package:flutter_clone_zap_on/Components/SideMenu/sidemenu.dart';
import 'package:flutter_clone_zap_on/Components/dashboard/info_dashboard.dart';
import 'package:flutter_clone_zap_on/Components/guideTv/info_guide_tv.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool _isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  int _isActivePage = 1;

  void _onData(int data) {
    _isActivePage = data;
    print(_isActivePage); // Hello World
  }

  @override
  void initState() {
    _isActivePage = 1;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zap On'),
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: const Color(0xFF17203A),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: _isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(onData: _onData),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: _isActivePage == 1
                        ? const InfoDashboard()
                        : _isActivePage == 5
                            ? const GuideTv()
                            : const OtherScreens()),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: _isSideMenuClosed ? 0 : 220,
            top: 0,
            child: SafeArea(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _isSideMenuClosed
                        ? const Color(0xFF029af0)
                        : Colors.transparent,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_isSideMenuClosed) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          setState(() {
                            _isSideMenuClosed = !_isSideMenuClosed;
                          });
                        },
                        child: _isSideMenuClosed
                            ? const Icon(
                                Icons.menu_outlined,
                                size: 40,
                                color: Colors.white,
                              )
                            : const Icon(Icons.close),
                      ),
                      _isSideMenuClosed
                          ? const SizedBox(
                              height: 45,
                              width: 140,
                              child:
                                  Image(image: AssetImage('assets/logo.png')),
                            )
                          : const SizedBox(),
                      _isSideMenuClosed
                          ? const SizedBox(
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          : const SizedBox()
                    ],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 590),
            padding: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 'floating_button_one',
                      onPressed: () {},
                      backgroundColor: Colors.greenAccent,
                      child: const Icon(LineIcons.whatSApp),
                    ),
                    FloatingActionButton(
                      heroTag: 'floating_button_two',
                      onPressed: () {},
                      backgroundColor: Colors.redAccent,
                      child: const Icon(Icons.chat),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),

      // floatingActionButton: SizedBox(
      //     width: 390,
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         FloatingActionButton(
      //           onPressed: () {},
      //           backgroundColor: Colors.greenAccent,
      //           child: const Icon(LineIcons.whatSApp),
      //         ),
      //         FloatingActionButton(
      //           onPressed: () {},
      //           backgroundColor: Colors.redAccent,
      //           child: const Icon(Icons.chat),
      //         ),
      //       ],
      //     )),
    );
  }
}
