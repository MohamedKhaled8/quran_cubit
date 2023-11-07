import 'package:flutter/material.dart';

class CustomDrower extends StatelessWidget {
  const CustomDrower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          )
        ],
      ),
    ));
  }
}
