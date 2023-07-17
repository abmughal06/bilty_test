import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../screens/auth/provider/auth_provider.dart';

Widget get uiProvider => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
            StreamProvider(
              create: (_) => AuthenticationProvider().authState,
              initialData: null,
            )
          ],
          child: const MyApp(),
        );
      },
    );
