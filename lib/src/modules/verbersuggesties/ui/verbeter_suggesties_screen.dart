import 'dart:async';
import 'package:assignment_2/src/modules/verbersuggesties/model/user_data_model.dart';
import 'package:assignment_2/src/widgets/vebeter/vebeter_user_card_details.dart';
import 'package:assignment_2/src/widgets/vebeter/verbeter_appbar_section.dart';
import 'package:assignment_2/src/widgets/vebeter/verbeter_top_status_option.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:assignment_2/src/modules/temp/ui/temp_page.dart';
import 'package:assignment_2/src/modules/verbersuggesties/bloc/user_bloc.dart';
import 'package:assignment_2/src/modules/verbersuggesties/bloc/user_state.dart';

class VerbeterSuggestiesScreen extends StatefulWidget {
  const VerbeterSuggestiesScreen({super.key});

  @override
  State<VerbeterSuggestiesScreen> createState() =>
      _VerbeterSuggestiesScreenState();
}

class _VerbeterSuggestiesScreenState extends State<VerbeterSuggestiesScreen> {
  // scroll controller for checking end of scrolling
  final ScrollController _scrollController = ScrollController();
  List<Datum> userList = [];

  // check page from api if avaible then true
  bool _hasReachedMax = true;
  @override
  void initState() {
    super.initState();
    //print("Start");
    context.read<UserBloc>().add(FetchUsers());
    _scrollController.addListener(_onScroll);
  }

  // it will check scroll move to the end or not
  // if it move to end then load more data
  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _hasReachedMax) {
      Future.delayed(const Duration(seconds: 2), () {
        context.read<UserBloc>().add(FetchUsers());
      });
    }
  }

  @override
  void dispose() {
    userList.clear();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoaded) {
          //if data loaded then add all data in the list
          userList.addAll(state.users);

          _hasReachedMax = state.hasReachedMax;
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // calling appbar widget
                VerbeterAppbarSection(context: context),

                //calling top three option widget
                const UserStatusTopThreeOptions(),

                // user list in form of card
                ListView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                  shrinkWrap: true,

                  itemCount: userList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == userList.length) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(

                            //checking data is available or not
                            child: !_hasReachedMax
                                ? const Text("No More Data to load")
                                : const CircularProgressIndicator()),
                      );
                    } else {
                      return UserCard(
                        user: userList[index],
                        index: index,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data Found'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TempPage(),
            ),
          );
        },
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
