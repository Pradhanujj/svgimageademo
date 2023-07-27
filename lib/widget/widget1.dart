import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {

  String assetName = 'assets/first.svg';
  final Widget svg = SvgPicture.asset(
      'assets/first.svg',
      fit: BoxFit.fitWidth,
      colorBlendMode: BlendMode.multiply);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 160),
          child: svg,
        ));
  }
}

