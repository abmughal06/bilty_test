import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../screens/auth/provider/auth_provider.dart';

Widget get uiProvider => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
      ],
      child: const MyApp(),
    );
