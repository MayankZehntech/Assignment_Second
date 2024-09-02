import 'package:flutter/material.dart';

class EmojiSection extends StatelessWidget {
  const EmojiSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hoeveel plezier heb je momenteel in je werk? ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '6',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '7',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Color.fromARGB(255, 238, 181, 24),
                        size: 40,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '8',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '9',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
