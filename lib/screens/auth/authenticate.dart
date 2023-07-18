import 'package:bilty/screens/auth/login.dart';
import 'package:bilty/screens/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../dashboard/dashboard.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(
      builder: (context, auth, b) {
        if (auth == null) {
          return const LoginScreen();
        } else {
          return const CheckRegistration();
        }
      },
    );
  }
}

class CheckRegistration extends StatelessWidget {
  const CheckRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel?>(
      builder: (context, user, b) {
        if (user == null) {
          return Register();
        } else {
          return Dashboard();
        }
      },
    );
  }
}
