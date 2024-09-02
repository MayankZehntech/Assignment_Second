import 'package:flutter/material.dart';

class UserStatusTopThreeOptions extends StatelessWidget {
  const UserStatusTopThreeOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle_outlined,
                color: Colors.orange,
                size: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Open',
                style: fontSize5(),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.add_circle_outline_sharp,
                color: Colors.blue,
                size: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Loopt',
                style: fontSize5(),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.arrow_circle_right,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Gereed',
                style: fontSize5(),
              )
            ],
          )
        ],
      ),
    );
  }

  TextStyle fontSize5() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  }
}
