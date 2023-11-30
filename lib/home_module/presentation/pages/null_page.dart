import 'package:flutter/material.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';

class NullPage extends StatelessWidget {
  const NullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Assets.svg.tabTrips.svg(),
      ),
    );
  }
}
