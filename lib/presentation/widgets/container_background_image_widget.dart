import 'package:flutter/material.dart';

class ContainerBackgroundImage extends StatelessWidget {
  Widget child;
  ContainerBackgroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: child);
  }
}
