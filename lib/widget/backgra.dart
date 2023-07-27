import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetBackground extends StatefulWidget {
  const WidgetBackground({Key? key}) : super(key: key);

  @override
  State<WidgetBackground> createState() => _WidgetBackgroundState();
}

class _WidgetBackgroundState extends State<WidgetBackground> {

  String assetName = 'assets/first.svg';
  final Widget svg = SvgPicture.asset(
      'assets/VEGGI HEART 1.svg',
      colorBlendMode: BlendMode.multiply);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: MediaQuery.of(context).padding),
        ],

      ),
    );
  }
}
