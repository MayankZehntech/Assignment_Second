import 'package:flutter/material.dart';

class SidebarTiles extends StatelessWidget {
  final String imagePath;
  final String tileText;
  final VoidCallback onTap;

  const SidebarTiles({
    super.key,
    required this.imagePath,
    required this.tileText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 170,
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  tileText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
