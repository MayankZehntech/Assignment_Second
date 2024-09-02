import 'package:assignment_2/src/modules/verbersuggesties/model/user_data_model.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Datum user;
  final int index;

  const UserCard({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    // passing list of color for background color for user card info
    final List userCardColorList = [
      Colors.orangeAccent,
      Colors.brown,
      const Color.fromARGB(255, 235, 115, 72),
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: userCardColorList[index % userCardColorList.length],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  user.email,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Start Date", style: _cardTextSmallStyle()),
                          Text("01-02-2012", style: _cardTextBoldStyle()),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("End Date", style: _cardTextSmallStyle()),
                          Text("11-02-2012", style: _cardTextBoldStyle()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Analyseer lange doorlooptijd",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            color: Colors.grey, style: BorderStyle.solid))),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            size: 25,
                          ),
                          SizedBox(width: 17),
                          Icon(
                            Icons.share_sharp,
                            size: 25,
                          ),
                          SizedBox(width: 17),
                          Icon(
                            Icons.add_a_photo,
                            size: 25,
                          ),
                          SizedBox(width: 17),
                          Icon(
                            Icons.message_outlined,
                            size: 25,
                          ),
                          SizedBox(width: 17),
                          Icon(
                            Icons.more,
                            size: 25,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.orange,
                        size: 25,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _cardTextSmallStyle() {
    return const TextStyle(
      fontSize: 15,
      color: Color.fromARGB(255, 66, 63, 63),
    );
  }

  TextStyle _cardTextBoldStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}
