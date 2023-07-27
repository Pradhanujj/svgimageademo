import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroungWidget2 extends StatefulWidget {

  @override
  State<BackgroungWidget2> createState() => _BackgroungWidget2State();
}

class _BackgroungWidget2State extends State<BackgroungWidget2> {

  String assetName = 'assets/background.svg';
  final Widget svg = SvgPicture.asset(
    'assets/background.svg',
    fit: BoxFit.cover,
    color: Colors.white24.withOpacity(0.7),
    colorBlendMode: BlendMode.lighten,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
            child: svg,
    );
  }
}
