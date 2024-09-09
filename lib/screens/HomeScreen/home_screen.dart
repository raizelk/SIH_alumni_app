import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);  // Added Key to the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 1,
        title: const Text('Alumni App'),
        leading: IconButton(
          onPressed: () {
            //open menu
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // do something
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              // do something
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
