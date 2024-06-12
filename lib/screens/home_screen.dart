import 'package:dzikir_harian/screens/dhikr_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Dzikir Pagi dan Petang'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const DhikrScreen(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: const Center(child: Text('Dzikir Pagi')),
            ),
          ),
          const SizedBox(height: 15.0),
          InkWell(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const DhikrScreen(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: const Center(child: Text('Dzikir Petang')),
            ),
          ),
        ],
      ),
    );
  }
}
