import 'package:bilty/screens/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(builder: (context, auth, b) {
      if (auth == null) {
        return const LoginScreen();
      } else {
        return const Home();
      }
    });
  }
}
