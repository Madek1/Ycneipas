import 'package:flutter/material.dart';

class TPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget> body;
  final Widget? bottomNavigationBar;

  const TPage({
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: ListView(
          children: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
