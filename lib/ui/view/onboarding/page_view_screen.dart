import 'convenient_screen.dart';
import 'local_screen.dart';
import 'quality_screen.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          children: const <Widget>[
            QualityScreen(),
            ConvenientScreen(),
            LocalScreen()
          ],
        ),
      ],
    );
  }
}
