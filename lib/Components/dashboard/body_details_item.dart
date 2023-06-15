import 'package:flutter/material.dart';
import '../../models/items.dart';

class BodyDetailsItem extends StatefulWidget {
  const BodyDetailsItem({super.key, required this.item});
  final Item item;
  @override
  State<BodyDetailsItem> createState() => _BodyDetailsItemState();
}

class _BodyDetailsItemState extends State<BodyDetailsItem> {
  int numberItems = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //It provide total height and width
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: const EdgeInsets.only(
                      top: 20, left: 20.0, right: 20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Expanded(child: bodyMain(context))],
                  ),
                ),
                itemImage(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column bodyMain(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.item.title,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: widget.item.color)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   "Mais imagens",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numberItems = 1;
                    });
                  },
                  child: changeImage(images: widget.item.image),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numberItems = 2;
                    });
                  },
                  child: changeImage(images: widget.item.image2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numberItems = 3;
                    });
                  },
                  child: changeImage(images: widget.item.image3),
                ),
              ],
            ),
          ],
        ),
        const Flexible(
            child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
          style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
          textAlign: TextAlign.justify,
        )),
      ],
    );
  }

  Hero itemImage(BuildContext context) {
    return Hero(
      tag: "${widget.item.id}",
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 235,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: child,
              );
              // return ScaleTransition(scale: animation, child: child);
            },
            child: numberItems == 2
                ? Container(
                    key: ValueKey(numberItems),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.item.image2),
                        )),
                    child: const SizedBox(height: 10,)
                  )
                : numberItems == 3
                    ? Container(
                        key: ValueKey(numberItems),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.item.image3),
                            )),
                        child: const SizedBox(height: 10,)
                      )
                    : numberItems == 1
                        ? Container(
                            key: ValueKey(numberItems),
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.item.image),
                                )),
                            child: const SizedBox(height: 10,)
                          )
                        : const SizedBox(),
          )),
    );
  }

  Column changeImage({String images = 'Item.id'}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          height: 24,
          width: 24,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: widget.item.color)),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: widget.item.color,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(images), fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}
