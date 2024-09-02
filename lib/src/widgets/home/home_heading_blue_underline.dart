import 'package:flutter/material.dart';

class HomeHeadingBlueUnderline extends StatelessWidget {
  final String headingText;
  const HomeHeadingBlueUnderline({
    super.key,
    required this.headingText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: Colors.blue,
            ),
          ),
        ),
        child: Text(
          headingText,
          // "Score",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
