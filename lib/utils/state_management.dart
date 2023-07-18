import 'package:bilty/models/provider/data_provider.dart';
import 'package:bilty/utils/widgets/bottom_nav.dart';
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
            ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
            ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
            StreamProvider(
              create: (_) => AuthenticationProvider().authState,
              initialData: null,
            ),
            StreamProvider.value(
              value: DataProvider().user,
              initialData: null,
            )
          ],
          child: const MyApp(),
        );
      },
    );
