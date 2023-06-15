import 'package:flutter/material.dart';
import 'package:flutter_clone_zap_on/Components/dashboard/details_item.dart';
import 'package:flutter_clone_zap_on/Components/dashboard/item_card.dart';
import '../../models/items.dart';

class InfoDashboard extends StatefulWidget {
  const InfoDashboard({Key? key}) : super(key: key);

  @override
  State<InfoDashboard> createState() => _InfoDashboardState();
}

class _InfoDashboardState extends State<InfoDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        // elevation: 0,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 80),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Items.length,
                itemBuilder: (context, index) => ItemCard(
                    index: index,
                    press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsItem(item: Items[index])),
                        )),
              ),
            )
          ],
        ));
  }
}
