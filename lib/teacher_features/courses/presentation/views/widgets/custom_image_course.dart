import 'package:flutter/material.dart';

class CustomImgeCourse extends StatelessWidget {
  const CustomImgeCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.asset(
        'assets/images/biology.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
