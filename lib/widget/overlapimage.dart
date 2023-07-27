import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OverlapImage extends StatefulWidget {
  const OverlapImage({Key? key}) : super(key: key);

  @override
  State<OverlapImage> createState() => _OverlapImageState();
}

class _OverlapImageState extends State<OverlapImage> {

  String assetName = 'assets/final 1.svg';
  final Widget svg = SvgPicture.asset(
      'assets/final 1.svg',
      colorBlendMode: BlendMode.multiply);

  String assetName1 = 'assets/yellow 1.svg';
  final Widget svg1 = SvgPicture.asset(
      'assets/yellow 1.svg',
      colorBlendMode: BlendMode.multiply);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            child: svg1,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body:Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: svg
              ),
            ),
        ],
    );
  }
}

