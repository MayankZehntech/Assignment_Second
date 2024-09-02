import 'package:assignment_2/src/modules/home/bloc/home_bloc.dart';
import 'package:assignment_2/src/widgets/home/emoji_section_home.dart';
import 'package:assignment_2/src/widgets/home/home_appbar_section.dart';
import 'package:assignment_2/src/widgets/home/home_heading_blue_underline.dart';
import 'package:assignment_2/src/widgets/home/home_score_card_section.dart';
import 'package:assignment_2/src/widgets/home/home_user_card_details.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    //calling home bloc
    context.read<HomeBloc>().add(FetchHomeUsers());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //calling widget appbar section
            HomeAppbarSection(context: context),

            //First heading of home page
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HomeHeadingBlueUnderline(
                      headingText: 'VerbeterSuggesties'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      size: 35,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            // calling widget for sliding card
            const HomeUserCardDetails(),

            // making widget for heading
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: HomeHeadingBlueUnderline(
                headingText: 'Score',
              ),
            ),
            // making widget for score section
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: HomeScoreCardSection(),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: HomeHeadingBlueUnderline(headingText: 'Moodindicator'),
            ),

            //Calling widget for emoji section
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 3),
              child: EmojiSection(),
            ),
          ],
        ),
      ),
    );
  }
}
