import 'package:assignment_2/src/modules/home/bloc/home_bloc.dart';
import 'package:assignment_2/src/modules/home/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUserCardDetails extends StatelessWidget {
  const HomeUserCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 335,
              viewportFraction: 0.80,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: false,
            ),
            items: state.users.map((user) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.only(bottom: 10, top: 6),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.only(right: 8, left: 8),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            title: Text(
                              user.email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            subtitle: Text(
                              '${user.firstName} ${user.lastName}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue,
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        //full user card details
                        listUserDetials(),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
        return const Text("Something Went Wrong");
      },
    );
  }
}

// font color and size set method
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

Expanded listUserDetials() {
  return Expanded(
    child: Container(
      //height: double.infinity,
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start Date", style: _cardTextSmallStyle()),
                  Text("01-02-2012", style: _cardTextBoldStyle()),
                ],
              ),
              const SizedBox(
                width: 25,
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
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Status", style: _cardTextSmallStyle()),
              const SizedBox(
                width: 55,
              ),
              Text("Lopend", style: _cardTextBoldStyle()),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("OK Status", style: _cardTextSmallStyle()),
              const SizedBox(
                width: 30,
              ),
              Text(
                "IN Order",
                style: _cardTextBoldStyle(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Analyseer lange doorlooptijd",
                style: TextStyle(
                  // color: Color.fromARGB(255, 119, 117, 117),
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
