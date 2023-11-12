import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final void Function(dynamic)? onChanged;
  const CustomSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.white,
      value: value,
      min: min,
      max: max,
      onChanged: onChanged,
    );
  }
}
