import 'package:flutter/material.dart';
import '../../models/items.dart';
import 'body_details_item.dart';

class DetailsItem extends StatelessWidget {
  
  final Item item;
  const DetailsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: buildAppBar(context),
      body: BodyDetailsItem(item: item,),
    
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: item.color,
      elevation: 0,
      // toolbarHeight: 0,
    );
  }
}