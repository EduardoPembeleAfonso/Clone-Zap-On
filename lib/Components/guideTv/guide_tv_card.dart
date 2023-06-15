import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Guide Tv model
import '../../models/guide_tv.dart';

class GuideTVCard extends StatefulWidget {
  final int index;

  const GuideTVCard({super.key, required this.index});

  @override
  State<GuideTVCard> createState() => _GuideTVCardState();

// double scale = 1.0;

//   void _changeScale() {
//     setState(() => scale = scale == 1.0 ? 3.0 : 1.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: AnimatedScale(
//         scale: _scale,
//         duration: const Duration(seconds: 1),
//         child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 200,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: const Color(0xFF097fc5)
//                 // image: DecorationImage(
//                 //     fit: BoxFit.cover, image: AssetImage(GuideTvs[index].image))
//                 ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                     width: 70,
//                     height: 70,
//                     margin: const EdgeInsets.only(left: 20),
//                     child: SvgPicture.asset(GuideTvs[index].image,
//                         colorFilter: const ColorFilter.mode(
//                             Colors.white, BlendMode.srcIn))),
//                 Container(
//                   alignment: Alignment.bottomRight,
//                   padding: const EdgeInsets.all(5),
//                   child: Text(
//                     GuideTvs[index].channel,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
}

class _GuideTVCardState extends State<GuideTVCard> {
  double scale = .9;

  void changeScale() {
    setState(() => scale = scale == .9 ? .7 : .9);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScale();
      },
      child: AnimatedScale(
        scale: scale,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 250),
        onEnd: () {
          setState(() => scale = .9);
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF097fc5)
                // image: DecorationImage(
                //     fit: BoxFit.cover, image: AssetImage(GuideTvs[index].image))
                ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(left: 20),
                    child: SvgPicture.asset(GuideTvs[widget.index].image,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn))),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    GuideTvs[widget.index].channel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
