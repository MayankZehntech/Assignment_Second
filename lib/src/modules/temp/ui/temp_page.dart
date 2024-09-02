import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

//build empty page for multiple click on button in complete app
class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temp Page',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 128, 178, 234),
            ),
            child: const Text(
              'BACK',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black),
            )),
      ),
    );
  }
}
