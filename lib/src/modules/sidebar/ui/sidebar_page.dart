import 'package:assignment_2/src/modules/temp/ui/temp_page.dart';
import 'package:assignment_2/src/modules/verbersuggesties/ui/verbeter_suggesties_screen.dart';
import 'package:assignment_2/src/widgets/sidebar/sidebar_tiles.dart';

import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

// list for tile images
final List imageList = [
  "assets/images/image-icons/bulb_icon.png",
  'assets/images/image-icons/action_icon.png',
  'assets/images/image-icons/graph_icon.png',
  'assets/images/image-icons/score_icon.png',
  'assets/images/image-icons/msgs_icon.png',
  'assets/images/image-icons/settings_icon.png',
];

// list for tile names
final List tileName = [
  "VerBeter Suggesties",
  "Mijn acties",
  "Moodindicator",
  "Scores",
  "Berichten",
  "Instellingen",
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  height: 180,
                  color: Colors.orange,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.all_inclusive_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              'Coimbee',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel_sharp,
                              size: 30,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: 110,
              left: 20,
              right: 20,
              bottom: 20,
              // making tiles for sidebar by using grid
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return SidebarTiles(
                    imagePath: imageList[index],
                    tileText: tileName[index],
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const VerbeterSuggestiesScreen(),
                          ),
                          (route) => route.isFirst,
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TempPage(),
                            ));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
