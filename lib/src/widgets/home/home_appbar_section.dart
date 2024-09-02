import 'package:assignment_2/src/modules/sidebar/ui/sidebar_page.dart';
import 'package:assignment_2/src/modules/temp/ui/temp_page.dart';
import 'package:flutter/material.dart';

class HomeAppbarSection extends StatelessWidget {
  const HomeAppbarSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.blue,
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    //Scaffold.of(context).openDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DrawerPage(),
                        ));
                  },
                  icon: const Icon(Icons.menu),
                  iconSize: 35,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TempPage(),
                        ));
                  },
                  icon: const Icon(Icons.notification_add),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10),
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Team Details",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
