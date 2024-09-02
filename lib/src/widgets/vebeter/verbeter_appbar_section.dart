import 'package:assignment_2/src/modules/sidebar/ui/sidebar_page.dart';
import 'package:assignment_2/src/modules/temp/ui/temp_page.dart';
import 'package:flutter/material.dart';

class VerbeterAppbarSection extends StatelessWidget {
  const VerbeterAppbarSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        alignment: Alignment.topLeft,
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DrawerPage(),
                          ));
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TempPage(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TempPage(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                'Vebetersuggesties',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

TextStyle fontSize5() {
  return const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
}
