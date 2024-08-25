import 'package:flutter/material.dart';

import '../widgets/create_class_viewbody.dart';

class CreateClassView extends StatelessWidget {
  const CreateClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CreateClassViewBody()),
    );
  }
}
