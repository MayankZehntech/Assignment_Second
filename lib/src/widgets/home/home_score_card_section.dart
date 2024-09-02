import 'package:flutter/material.dart';

class HomeScoreCardSection extends StatelessWidget {
  const HomeScoreCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 11, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/image-icons/score_icon.png',
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "65",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Goed Bezig, #1Emma Green",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
