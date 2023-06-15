import 'package:flutter/material.dart';

// Item model
import '../../models/items.dart';

class ItemCard extends StatelessWidget {
  final int index;
  final Function press;
  const ItemCard({super.key, required this.index, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: SizedBox(
          child: Hero(
        tag: "${Items[index].id}",
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 5),
          height: 200,
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(Items[index].image))),
        ),
      )),
    );
  }
}
