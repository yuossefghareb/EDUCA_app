import 'package:flutter/material.dart';

class LogoPageCreateClass extends StatelessWidget {
  const LogoPageCreateClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 231,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/rectangle.png'), fit: BoxFit.fill),
      ),
    );
  }
}
