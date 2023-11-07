import 'package:flutter/material.dart';

class CustomErrorState extends StatelessWidget {
  final String errorMessage;
  const CustomErrorState({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
