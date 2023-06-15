import 'package:flutter/material.dart';
import 'package:flutter_clone_zap_on/Components/guideTv/guide_tv_card.dart';


// models
import '../../models/guide_tv.dart';

class GuideTv extends StatefulWidget {
  const GuideTv({Key? key}) : super(key: key);

  @override
  State<GuideTv> createState() => _GuideTvState();
}

class _GuideTvState extends State<GuideTv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 90),
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 3 ,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
            ),
            itemCount: GuideTvs.length,
           itemBuilder: (context, index) => GuideTVCard(index: index)
           )
      ),
    );
  }
}
