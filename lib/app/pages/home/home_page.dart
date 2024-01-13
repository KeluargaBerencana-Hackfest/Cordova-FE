import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('user sign in as ${user?.email ?? "Unknown"}'),
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
