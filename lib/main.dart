import 'package:coreapp1/facilities_api.dart';
import 'package:coreapp1/home.dart';
import 'package:coreapp1/providers/provider_login_states.dart';
import 'package:coreapp1/Login_page/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';

void main() {
  var app = MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginStates(),
    )
  ], child: const MyApp());
  runApp(app);

  FacilitiesApi().getFacilities();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const Scaffold(
        body: HomePage(),

      ),
    );
  }
}
