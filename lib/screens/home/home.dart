import 'package:bilty/screens/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthenticationProvider().logout();
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
