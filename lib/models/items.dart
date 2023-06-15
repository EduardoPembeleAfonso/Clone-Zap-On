import 'package:flutter/material.dart';

class Item {
  final String image, image2, image3, channel, title, description;
  final int id;
  final Color color;
  Item({
    required this.id,
    required this.image,
    required this.image2,
    required this.image3,
    required this.title,
    required this.description,
    required this.color,
    required this.channel
  });
}

List<Item> Items = [
  Item(
      id: 1,
      channel: '001',
      title: "Viaja para Turquia",
      description: dummyText,
      image: "assets/dashboard/turkey_main.png",
      image2: 'assets/dashboard/turkey.jpg',
      image3: 'assets/dashboard/turkey01.jpg',
      color: const Color(0xFF706272)),
  Item(
      id: 2,
      channel: '002',
      title: "Zap Wifi",
      description: dummyText,
      image: "assets/dashboard/zap_wifi.png",
      image2: 'assets/dashboard/zap_wifi01.jpg',
      image3: 'assets/dashboard/zap_wifi02.jpg',
      color: const Color(0xFF5356c3)),
  Item(
      id: 3,
      channel: '40',
      title: "Canal Panda",
      description: dummyText,
      image: "assets/dashboard/panda_main.png",
      image2: 'assets/dashboard/panda.jpg',
      image3: 'assets/dashboard/panda01.jpg',
      color: const Color(0xFF4196cd)),
  Item(
      id: 4,
      channel: '61',
      title: "Canal Dizi",
      description: dummyText,
      image: "assets/dashboard/dizi_main.png",
      image2: 'assets/dashboard/dizi.jpg',
      image3: 'assets/dashboard/dizi01.png',
      color: const Color(0xFF522a9c)),
  Item(
      id: 5,
      channel: '40 & 47',
      title: "Mes das criancas",
      description: dummyText,
      image: "assets/dashboard/child_main.png",
      image2: 'assets/dashboard/childs.jpg',
      image3: 'assets/dashboard/childs01.jpg',
      color: const Color.fromARGB(255, 124, 121, 121)),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
