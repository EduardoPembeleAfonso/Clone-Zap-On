import 'package:flutter/material.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

// welcome to the episode 5
class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.onData,
  }) : super(key: key);

  final void Function(int) onData;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFFffffff),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const InfoCard(
                name: 'Edocha',
              ),
              const SizedBox(
                height: 30,
              ),
              SideMenuTile(onData: widget.onData)
            ],
          ),
        ),
      ),
    );
  }
}
